//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import SwiftUI

@main
struct MovieAppApp: App {

    @StateObject var appAssembler = AppAssembler()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SearchView()
            }
        }
    }
}
