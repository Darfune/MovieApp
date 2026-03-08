//
//  SearchViewModelTests.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 8/3/26.
//

import XCTest
import Swinject
@testable import MovieApp

@MainActor
final class SearchViewModelTests: XCTestCase {

    private var mockRepository: MockMovieSearchProtocol!
    private var sut: SearchViewModel!

    override func setUp() {
        super.setUp()
        mockRepository = MockMovieSearchProtocol()

        let repository: MovieSearchProtocol = mockRepository!
        Resolver.shared.getContainer().register(SearchMoviesUseCase.self) { _ in
            SearchMoviesUseCase(repository: repository as! any MovieSearchProtocol )
        }

        sut = SearchViewModel()
    }

    override func tearDown() {
        sut = nil
        mockRepository = nil
        super.tearDown()
    }

    func test_search_onSuccess_setsResults() async {
        mockRepository.result = .success(.success(movies: SearchedMovie.mocks))

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
        mockRepository.result = .failure(URLError(.notConnectedToInternet))

        sut.query = "Blade"
        sut.search()

        await waitForState(notEqualTo: "loading")

        if case .error = sut.state { } else {
            XCTFail("Expected .error, got \(sut.state)")
        }
    }

    // MARK: - Helper

    private func waitForState(notEqualTo stateName: String, timeout: TimeInterval = 2) async {
        let deadline = Date().addingTimeInterval(timeout)
        while stateLabel(sut.state) == stateName && Date() < deadline {
            await Task.yield()
        }
    }

    private func stateLabel(_ state: SearchViewModel.State) -> String {
        switch state {
        case .idle:     return "idle"
        case .loading:  return "loading"
        case .results:  return "results"
        case .empty:    return "empty"
        case .error:    return "error"
        }
    }
}
