//
//  Colors.swift
//  MovieApp
//
//  Created by Jason Charalampidis on 7/3/26.
//

import SwiftUI

extension Color {
    static let cinemaBlack    = Color(hex: "#0A0A0F")
    static let cinemaDeep     = Color(hex: "#12121A")
    static let cinemaCard     = Color(hex: "#1C1C28")
    static let cinemaBorder   = Color(hex: "#2A2A3E")
    static let cinemaGold     = Color(hex: "#F5C842")
    static let cinemaAmber    = Color(hex: "#E8974A")
    static let cinemaRed      = Color(hex: "#E84A5F")
    static let cinemaCream    = Color(hex: "#F0EBE0")
    static let cinemaSubtext  = Color(hex: "#8A8AA0")
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
