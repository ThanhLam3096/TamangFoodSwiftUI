//
//  OutlineActiveButtonStyle.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/8/25.
//

import Foundation
import SwiftUI

struct OutlineActiveButtonStyle: ButtonStyle {
    var activeColor: Color = .activeColor
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.yuGothicUISemibold(size: 15))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(configuration.isPressed ? .white : activeColor)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(configuration.isPressed ? Color.activeColor : .clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(activeColor, lineWidth: 1)
            )
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
