//
//  MovieSearchImplementationTests.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 9/3/26.
//

import XCTest
@testable import MovieApp

final class MovieSearchImplementationTests: XCTestCase {

    private var mockApiClient: MockApiClient!
    private var sut: MovieSearchImplementation!

    override func setUp() {
        super.setUp()
        mockApiClient = MockApiClient()
        sut = MovieSearchImplementation(apiClient: mockApiClient)
    }

    override func tearDown() {
        sut = nil
        mockApiClient = nil
        super.tearDown()
    }

    func test_searchMovies_onSuccess_returnsResponse() async throws {
        let expected = SearchResponse(
            movies: SearchedMovie.mocks,
            totalResults: "\(SearchedMovie.mocks.count)",
            response: "True",
            error: nil
        )
        mockApiClient.stubbedData = try JSONEncoder().encode(expected)

        let result = try await sut.searchMovies(query: "Blade", page: 1)

        XCTAssertEqual(result.response, "True")
        XCTAssertEqual(result.movies?.count, SearchedMovie.mocks.count)
    }

    func test_searchMovies_onFailure_throwsError() async {
        mockApiClient.stubbedError = URLError(.notConnectedToInternet)

        do {
            _ = try await sut.searchMovies(query: "Blade", page: 1)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}
