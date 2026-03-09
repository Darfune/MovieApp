//
//  Apiclienttests.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 9/3/26.
//

import XCTest
@testable import MovieApp


final class ApiClientImplementationTests: XCTestCase {

    private var sut: ApiClientImplementation!
    private var testRequest: URLRequest!

    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        sut = ApiClientImplementation(session: URLSession(configuration: config))
        testRequest = URLRequest(url: URL(string: "https://test.com")!)
    }

    override func tearDown() {
        MockURLProtocol.requestHandler = nil
        sut = nil
        super.tearDown()
    }

    func test_makeRequest_200_decodesResponse() async throws {
        let movie = SearchedMovie.mocks[0]
        let data = try JSONEncoder().encode(movie)

        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(url: self.testRequest.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!, data)
        }

        let result: SearchedMovie = try await sut.makeRequest(to: testRequest)
        XCTAssertEqual(result.imdbID, movie.imdbID)
    }

    func test_makeRequest_401_throwsUnauthorized() async {
        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(url: self.testRequest.url!, statusCode: 401, httpVersion: nil, headerFields: nil)!, Data())
        }

        do {
            let _: SearchedMovie = try await sut.makeRequest(to: testRequest)
            XCTFail("Expected error")
        } catch ApiError.unauthorized {
            // pass
        } catch {
            XCTFail("Wrong error: \(error)")
        }
    }

    func test_makeRequest_404_throwsNotFound() async {
        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(url: self.testRequest.url!, statusCode: 404, httpVersion: nil, headerFields: nil)!, Data())
        }

        do {
            let _: SearchedMovie = try await sut.makeRequest(to: testRequest)
            XCTFail("Expected error")
        } catch ApiError.notFound {
            // pass
        } catch {
            XCTFail("Wrong error: \(error)")
        }
    }

    func test_makeRequest_500_throwsServerError() async {
        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(url: self.testRequest.url!, statusCode: 500, httpVersion: nil, headerFields: nil)!, Data())
        }

        do {
            let _: SearchedMovie = try await sut.makeRequest(to: testRequest)
            XCTFail("Expected error")
        } catch ApiError.serverError {
            // pass
        } catch {
            XCTFail("Wrong error: \(error)")
        }
    }
}
extension SearchedMovie: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title,   forKey: .title)
        try container.encode(year,    forKey: .year)
        try container.encode(imdbID,  forKey: .imdbID)
        try container.encode(type,    forKey: .type)
        try container.encode(poster,  forKey: .poster)
    }
}
