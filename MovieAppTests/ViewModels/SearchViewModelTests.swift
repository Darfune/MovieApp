//
//  SearchViewModelTests.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 9/3/26.
//

import XCTest
@testable import MovieApp
import Swinject


@MainActor
final class SearchViewModelTests: XCTestCase {

    private var mockUseCase: MockSearchMoviesUseCase!
    private var sut: SearchViewModel!

    override func setUp() {
        super.setUp()
        mockUseCase = MockSearchMoviesUseCase()
        sut = SearchViewModel()
        sut.useCase = mockUseCase
    }

    override func tearDown() {
        sut = nil
        mockUseCase = nil
        super.tearDown()
    }

    func test_search_onSuccess_setsResults() async throws {
        let response = SearchResponse(
            movies: SearchedMovie.mocks,
            totalResults: "\(SearchedMovie.mocks.count)",
            response: "True",
            error: nil
        )
        mockUseCase.stubbedData = try JSONEncoder().encode(response)

        sut.query = "Blade"
        sut.search()

        await waitForState(notEqualTo: "loading")

        if case .results(let movies) = sut.state {
            XCTAssertEqual(movies.count, SearchedMovie.mocks.count)
        } else {
            XCTFail("Expected .results, got \(sut.state)")
        }
    }

    func test_search_onFailure_setsError() async {
        mockUseCase.stubbedError = URLError(.notConnectedToInternet)

        sut.query = "Blade"
        sut.search()

        await waitForState(notEqualTo: "loading")

        if case .error = sut.state { } else {
            XCTFail("Expected .error, got \(sut.state)")
        }
    }

    func test_search_emptyQuery_setsIdle() {
        sut.query = ""
        sut.search()

        if case .idle = sut.state { } else {
            XCTFail("Expected .idle, got \(sut.state)")
        }
    }


    func test_loadNextPage_appendsResults() async throws {
        let page1Movies = Array(SearchedMovie.mocks.prefix(5))
        let page2Movies = Array(SearchedMovie.mocks.suffix(5))

        var callCount = 0
        mockUseCase.stubbedDataProvider = { _ in
            callCount += 1
            let movies = callCount == 1 ? page1Movies : page2Movies
            let response = SearchResponse(
                movies: movies,
                totalResults: "10",
                response: "True",
                error: nil
            )
            return try JSONEncoder().encode(response)
        }

        sut.query = "Blade"
        sut.search()
        await waitForState(notEqualTo: "loading")

        sut.loadNextPage()
        await waitForPaginatingToFinish()

        if case .results(let movies) = sut.state {
            XCTAssertEqual(movies.count, 10)
        } else {
            XCTFail("Expected .results, got \(sut.state)")
        }
    }

    private func waitForPaginatingToFinish(timeout: TimeInterval = 2) async {
        let deadline = Date().addingTimeInterval(timeout)
        while sut.isPaginating && Date() < deadline {
            await Task.yield()
        }
    }
    private func waitForState(notEqualTo name: String, timeout: TimeInterval = 2) async {
        let deadline = Date().addingTimeInterval(timeout)
        while stateLabel(sut.state) == name && Date() < deadline {
            await Task.yield()
        }
    }

    private func stateLabel(_ state: SearchViewModel.State) -> String {
        switch state {
        case .idle:    return "idle"
        case .loading: return "loading"
        case .results: return "results"
        case .empty:   return "empty"
        case .error:   return "error"
        }
    }
}
