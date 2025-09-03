//
//  Text.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 31/8/25.
//

import Foundation
import SwiftUI

struct BodyUIRegularTextModifier: ViewModifier {
    var size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.yuGothicUIRegular(size: size))
            .foregroundStyle(Color.bodyTextColor)
    }
}

struct MainUIRegularTextModifier: ViewModifier {
    var size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.yuGothicUIRegular(size: size))
            .foregroundStyle(Color.mainColor)
    }
}

extension View {
    func bodyUIRegularText(size: CGFloat) -> some View {
        self.modifier(BodyUIRegularTextModifier(size: size))
    }
    
    func mainUIRegularText(size: CGFloat) -> some View {
        self.modifier(MainUIRegularTextModifier(size: size))
    }
}
