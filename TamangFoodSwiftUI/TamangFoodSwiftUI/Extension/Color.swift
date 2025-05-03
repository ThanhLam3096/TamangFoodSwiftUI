//
//  Color.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 10/4/25.
//

import Foundation
import SwiftUI

extension Color {
    static let activeColor = Color(hex: "#EEA734")
    static let mainColor = Color(hex: "#010F07")
    static let bodyTextColor = Color(hex: "#868686")
    static let inputColor = Color(hex: "#FBFBFB")
    static let bgColor = Color(hex: "#FFFFFF")
    static let accentColor = Color(hex: "#F8B64C")
    static let greenColor = Color(hex: "#22A45D")
    static let redColor = Color(hex: "#FF7058")
    static let yellowColor = Color(hex: "#FFD15C")
    static let tabBarColor = Color(hex: "#979797")
    static let blackColor = Color(hex: "#000000")
    static let cacuColor = Color(hex: "#F8F8F8")
    static let titleColor = Color(hex: "#3A3A3A")
    static let lineView = Color(hex: "#F6F6F6")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
