//
//  AppAssembler.swift
//  NovibetAssignment
//
//  Created by Jason Charalampidis on 23/11/24.
//

import Combine
import Swinject

class AppAssembler: ObservableObject {
    let mainAppContainer: Container
    
    init() {
        self.mainAppContainer = Resolver.shared.getContainer()
        self.registerAppDependencies()
    }
    
    private func registerAppDependencies() {
        
        // Network
        registerApiClientDependencies()
        
        // Protocols
        MovieSearchProtocolDependencies()
        MovieDetailsProtocolDependencies()
        
        //UseCases
        seatchMoviesUseCaseDependencies()
        fetchMovieDetailsByIdUseCaseDependencies()
        fetchMovieDetailsByTitleUseCaseDependencies()
    }
    
    //MARK: Network
    private func registerApiClientDependencies() {
        mainAppContainer.register(ApiClient.self) { _ in
            ApiClientImplementation()
        }
    }

    
    //MARK: Repositories
    private func MovieSearchProtocolDependencies() {
        mainAppContainer.register(MovieSearchProtocol.self) { resolver in
            MovieSearchImplementation(apiClient: resolver.resolve(ApiClient.self)!)
        }
    }
    private func MovieDetailsProtocolDependencies() {
        mainAppContainer.register(MovieDetailsProtocol.self) { resolver in
            MovieDetailsImplementation(apiClient: resolver.resolve(ApiClient.self)!)
        }
    }
    

    
    private func seatchMoviesUseCaseDependencies() {
        mainAppContainer.register(SearchMoviesUseCase.self) { resolver in
            SearchMoviesUseCase(repository: resolver.resolve(MovieSearchProtocol.self)!)
        }
    }
    
    private func fetchMovieDetailsByIdUseCaseDependencies() {
        mainAppContainer.register(FetchMovieDetailsByIdUseCase.self) { resolver in
            FetchMovieDetailsByIdUseCase(repository: resolver.resolve(MovieDetailsProtocol.self)!)
        }
    }
    
    private func fetchMovieDetailsByTitleUseCaseDependencies() {
        mainAppContainer.register(FetchMovieDetailsByTitleUseCase.self) { resolver in
            FetchMovieDetailsByTitleUseCase(repository: resolver.resolve(MovieDetailsProtocol.self)!)
        }
    }
    
}
