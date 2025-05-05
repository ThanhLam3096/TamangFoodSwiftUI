//
//  Font.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 10/4/25.
//
import SwiftUI
import Foundation
import UIKit

extension Font {
    
    static func hiraginoSansW3(size: CGFloat) -> Font {
        .custom("HiraginoSans-W3", size: size)
    }
    
    static func hiraginoSansW5(size: CGFloat) -> Font {
        .custom("HiraginoSans-W5", size: size)
    }
    
    static func hiraginoSansW6(size: CGFloat) -> Font {
        .custom("HiraginoSans-W6", size: size)
    }
    
    static func yuGothic(size: CGFloat) -> Font {
        .custom("YuGothic", size: size)
    }
    
    static func yuGothicMedium(size: CGFloat) -> Font {
        .custom("YuGothic-Medium", size: size)
    }
    
    static func yuGothicBold(size: CGFloat) -> Font {
        .custom("YuGothic-Bold", size: size)
    }
    
    static func yuGothicLight(size: CGFloat) -> Font {
        .custom("YuGothic-Light", size: size)
    }
    
    static func yuGothicUILight(size: CGFloat) -> Font {
        .custom("YuGothicUI-Light", size: size)
    }
    
    static func yuGothicUIRegular(size: CGFloat) -> Font {
        .custom("YuGothicUI-Regular", size: size)
    }
    
    static func yuGothicUISemibold(size: CGFloat) -> Font {
        .custom("YuGothicUI-Semibold", size: size)
    }
    
    static func yuGothicUIBold(size: CGFloat) -> Font {
        .custom("YuGothicUI-Bold", size: size)
    }
}

extension UIFont {
    
    static func hiraginoSansW3(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "HiraginoSans-W3", size: size)
    }
    
    static func hiraginoSansW5(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "HiraginoSans-W5", size: size)
    }
    
    static func hiraginoSansW6(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "HiraginoSans-W6", size: size)
    }
    
    static func fontYugothic(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "YuGothic", size: size)
    }
    
    static func fontYugothicMedium(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "YuGothic-Medium", size: size)
    }
    
    static func fontYugothicBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "YuGothic-Bold", size: size)
    }
    
    static func fontYugothicLight(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "YuGothic-Light", size: size)
    }
    
    static func fontYugothicUILight(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "YuGothicUI-Light", size: size)
    }
    
    static func fontYugothicUIRegular(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "YuGothicUI-Regular", size: size)
    }
    
    static func fontYugothicUISemiBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "YuGothicUI-Semibold", size: size)
    }
    
    static func fontYugothicUIBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "YuGothicUI-Bold", size: size)
    }
}
