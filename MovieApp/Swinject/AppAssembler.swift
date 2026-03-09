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
        mainAppContainer.register(SearchMoviesUseCaseProtocol.self) { resolver in
            SearchMoviesUseCase(repository: resolver.resolve(MovieSearchProtocol.self)!)
        }
    }
    
    private func fetchMovieDetailsByIdUseCaseDependencies() {
        mainAppContainer.register(FetchMovieDetailsByIdUseCaseProtocol.self) { resolver in
            FetchMovieDetailsByIdUseCase(repository: resolver.resolve(MovieDetailsProtocol.self)!)
        }
    }
}
