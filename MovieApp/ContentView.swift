//
//  ContentView.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import SwiftUI
import ConfidentialKit

struct ContentView: View {
    
    @State private var movieTitle: String = ""
    
    private let apiClient: ApiClient = ApiClientImplementation(
        responseHandler: ResponseHandlerImplementation()
    )
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(movieTitle.isEmpty ? "Press the button to fetch a movie" : movieTitle)
            
            Button("Fetch Blade Runner") {
                Task {
                    await fetchMovie()
                }
            }
        }
        .padding()
    }
    
    private func fetchMovie() async {
        do {
            let urlRequest = try GetMovieUrlBuilder.byTitle(title: "bladerunner").asURLRequest()
            let movie: MovieDetail = try await apiClient.makeRequest(to: urlRequest)
            movieTitle = "\(movie.title) (\(movie.year))"
            print(movieTitle)
        } catch {
            movieTitle = "Error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ContentView()
}
