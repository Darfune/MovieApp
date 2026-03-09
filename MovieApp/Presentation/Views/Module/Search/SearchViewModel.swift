//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {

    enum State {
        case idle
        case loading
        case results([SearchedMovie])
        case empty
        case error(String)
    }

    @Published var query = ""
    @Published private(set) var state: State = .idle
    @Published private(set) var isPaginating = false

    @Inject var useCase: SearchMoviesUseCaseProtocol?

    private var currentPage = 1
    private var hasMorePages = true

    init() {}

    func search() {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            setState(.idle)
            return
        }

        currentPage = 1
        hasMorePages = true
        setState(.loading)
        fetchMovies(page: currentPage, appending: false)
    }

    func loadNextPage() {
        guard hasMorePages, !isPaginating else { return }
        guard case .results = state else { return }

        currentPage += 1
        setIsPaginating(true)
        fetchMovies(page: currentPage, appending: true)
    }

    private func fetchMovies(page: Int, appending: Bool) {
        Task {
            do {
                guard let useCase else {
                    setState(.error("Use case not available"))
                    return
                }

                let response = try await useCase.execute(query: query, page: page)

                guard response.isSuccess else {
                    if appending {
                        hasMorePages = false
                        setIsPaginating(false)
                    } else {
                        setState(.error(response.error ?? "Something went wrong"))
                    }
                    return
                }

                let newMovies = response.movies ?? []

                if appending {
                    guard case .results(let current) = state else { return }
                    let existingIDs = Set(current.map(\.imdbID))
                    let newIDs = Set(newMovies.map(\.imdbID))

                    guard !newIDs.isSubset(of: existingIDs) else {
                        hasMorePages = false
                        setIsPaginating(false)
                        return
                    }

                    let uniqueNew = newMovies.filter { !existingIDs.contains($0.imdbID) }
                    setState(.results(current + uniqueNew))
                    setIsPaginating(false)
                } else {
                    setState(newMovies.isEmpty ? .empty : .results(newMovies))
                }

            } catch {
                if appending {
                    hasMorePages = false
                    setIsPaginating(false)
                } else {
                    setState(.error(error.localizedDescription))
                }
            }
        }
    }

    @MainActor private func setState(_ newState: State) { state = newState }
    @MainActor private func setIsPaginating(_ value: Bool) { isPaginating = value }
}
