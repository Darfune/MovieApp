//
//  MovieDetailViewModelTests.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 9/3/26.
//

import XCTest
import Swinject
@testable import MovieApp

@MainActor
final class MovieDetailViewModelTests: XCTestCase {

    private var mockUseCase: MockFetchMovieDetailsByIdUseCase!
    private var sut: MovieDetailViewModel!

    override func setUp() {
        super.setUp()
        mockUseCase = MockFetchMovieDetailsByIdUseCase()
        sut = MovieDetailViewModel()
        sut.useCase = mockUseCase
    }

    override func tearDown() {
        sut = nil
        mockUseCase = nil
        super.tearDown()
    }

    func test_load_onSuccess_setsLoaded() async throws {
        let movie = MovieDetails.mocks[0]
        mockUseCase.stubbedData = try JSONEncoder().encode(movie)

        sut.load(imdbID: movie.imdbID)

        await waitForState(notEqualTo: "loading")

        if case .loaded(let loaded) = sut.state {
            XCTAssertEqual(loaded.imdbID, movie.imdbID)
        } else {
            XCTFail("Expected .loaded, got \(sut.state)")
        }
    }

    func test_load_onFailure_setsError() async {
        mockUseCase.stubbedError = URLError(.notConnectedToInternet)

        sut.load(imdbID: MovieDetails.mocks[0].imdbID)

        await waitForState(notEqualTo: "loading")

        if case .error = sut.state { } else {
            XCTFail("Expected .error, got \(sut.state)")
        }
    }

    private func waitForState(notEqualTo name: String, timeout: TimeInterval = 2) async {
        let deadline = Date().addingTimeInterval(timeout)
        while stateLabel(sut.state) == name && Date() < deadline {
            await Task.yield()
        }
    }

    private func stateLabel(_ state: MovieDetailViewModel.State) -> String {
        switch state {
        case .idle:    return "idle"
        case .loading: return "loading"
        case .loaded:  return "loaded"
        case .error:   return "error"
        }
    }
}
