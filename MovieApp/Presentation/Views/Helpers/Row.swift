//
//  Row.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 8/3/26.
//

import SwiftUI

func row(_ label: String, _ value: String) -> some View {
    HStack(alignment: .top, spacing: 8) {
        Text(label)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .frame(width: 70, alignment: .leading)
        Text(value)
            .font(.subheadline)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
