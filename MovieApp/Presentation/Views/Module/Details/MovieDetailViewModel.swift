//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation
import Combine

final class MovieDetailViewModel: ObservableObject {

    enum State {
        case idle
        case loading
        case loaded(MovieDetails)
        case error(String)
    }

    @Published private(set) var state: State = .idle

    @Inject var useCase: FetchMovieDetailsByIdUseCaseProtocol?

    init() {}

    func load(imdbID: String) {
        setState(.loading)

        Task {
            do {
                guard let useCase else {
                    setState(.error("Use case not available"))
                    return
                }
                let movie = try await useCase.execute(id: imdbID)
                setState(.loaded(movie))
            } catch {
                setState(.error(error.localizedDescription))
            }
        }
    }

    @MainActor
    private func setState(_ newState: State) {
        state = newState
    }
}
