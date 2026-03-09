//
//  MovieDetailsImplementationTests.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 9/3/26.
//

import XCTest
@testable import MovieApp

final class MovieDetailsImplementationTests: XCTestCase {

    private var mockApiClient: MockApiClient!
    private var sut: MovieDetailsImplementation!

    override func setUp() {
        super.setUp()
        mockApiClient = MockApiClient()
        sut = MovieDetailsImplementation(apiClient: mockApiClient)
    }

    override func tearDown() {
        sut = nil
        mockApiClient = nil
        super.tearDown()
    }

    func test_fetchMovieDetailsById_onSuccess_returnsMovie() async throws {
        let expected = MovieDetails.mocks[0]
        mockApiClient.stubbedData = try JSONEncoder().encode(expected)

        let result = try await sut.fetchMovieDetails(by: expected.imdbID)

        XCTAssertEqual(result.imdbID, expected.imdbID)
        XCTAssertEqual(result.title, expected.title)
    }

    func test_fetchMovieDetailsById_onFailure_throwsError() async {
        mockApiClient.stubbedError = URLError(.notConnectedToInternet)

        do {
            _ = try await sut.fetchMovieDetails(by: "tt0083658")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}
