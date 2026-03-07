//
//  ContentView.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import SwiftUI
import ConfidentialKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(Secrets)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
