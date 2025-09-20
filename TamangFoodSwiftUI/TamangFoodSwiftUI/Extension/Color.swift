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
    static let myAccentColor = Color(hex: "#F8B64C")
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

struct UIKitColor {
    static let activeColor = UIColor(hex: "#EEA734")
    static let mainColor = UIColor(hex: "#010F07")
    static let bodyTextColor = UIColor(hex: "#868686")
    static let inputColor = UIColor(hex: "#FBFBFB")
    static let bgColor = UIColor(hex: "#FFFFFF")
    static let myAccentColor = UIColor(hex: "#F8B64C")
    static let greenColor = UIColor(hex: "#22A45D")
    static let redColor = UIColor(hex: "#FF7058")
    static let yellowColor = UIColor(hex: "#FFD15C")
    static let tabBarColor = UIColor(hex: "#979797")
    static let blackColor = UIColor(hex: "#000000")
    static let cacuColor = UIColor(hex: "#F8F8F8")
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
