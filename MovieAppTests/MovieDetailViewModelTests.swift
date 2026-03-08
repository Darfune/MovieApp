//
//  MovieDetailViewModelTests.swift
//  MovieAppTests
//
//  Created by Jason Charalampidis on 8/3/26.
//

import XCTest
import Swinject
@testable import MovieApp

@MainActor
final class MovieDetailViewModelTests: XCTestCase {

    private var mockRepository: MockMovieDetailsProtocol!
    private var sut: MovieDetailViewModel!

    override func setUp() {
        super.setUp()
        mockRepository = MockMovieDetailsProtocol()

        let repository = mockRepository!
        Resolver.shared.getContainer().register(FetchMovieDetailsByIdUseCase.self) { _ in
            FetchMovieDetailsByIdUseCase(repository: repository)
        }

        sut = MovieDetailViewModel()
    }

    override func tearDown() {
        sut = nil
        mockRepository = nil
        super.tearDown()
    }

    func test_load_onSuccess_setsLoaded() async {
        let movie = MovieDetails.mocks[0]
        mockRepository.result = .success(movie)

        sut.load(imdbID: movie.imdbID)

        await waitForState(notEqualTo: "loading")

        if case .loaded(let loaded) = sut.state {
            XCTAssertEqual(loaded.imdbID, movie.imdbID)
        } else {
            XCTFail("Expected .loaded, got \(sut.state)")
        }
    }

    func test_load_onFailure_setsError() async {
        mockRepository.result = .failure(URLError(.notConnectedToInternet))

        sut.load(imdbID: MovieDetails.mocks[0].imdbID)

        await waitForState(notEqualTo: "loading")

        if case .error = sut.state { } else {
            XCTFail("Expected .error, got \(sut.state)")
        }
    }

    private func waitForState(notEqualTo stateName: String, timeout: TimeInterval = 2) async {
        let deadline = Date().addingTimeInterval(timeout)
        while stateLabel(sut.state) == stateName && Date() < deadline {
            await Task.yield()
        }
    }

    private func stateLabel(_ state: MovieDetailViewModel.State) -> String {
        switch state {
        case .idle:     return "idle"
        case .loading:  return "loading"
        case .loaded:   return "loaded"
        case .error:    return "error"
        }
    }
}
