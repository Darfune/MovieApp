//
//  Font.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import SwiftUI

enum AppFont {
    static func serif(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .serif)
    }
    static func mono(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .monospaced)
    }
}
