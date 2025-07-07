//
//  Color+Extension.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

import SwiftUI

extension Color {
    static var random: Color {
        let red = Double.random(in: 0.2...0.9)
        let green = Double.random(in: 0.2...0.9)
        let blue = Double.random(in: 0.2...0.9)
        return Color(red: red, green: green, blue: blue)
    }
    
    static let graySlate100 = Color(hex: "#F1F5F9")
}
extension Color {
    init(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue: UInt64 = 0

        Scanner(string: hexString.replacingOccurrences(of: "#", with: "")).scanHexInt64(&rgbValue)

        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0
        let opacity = hexString.count > 7 ? Double((rgbValue >> 24) & 0xFF) / 255.0 : 1.0

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

