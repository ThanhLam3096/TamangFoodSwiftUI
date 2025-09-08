//
//  OrangeButton.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 12/4/25.
//

import SwiftUI

struct OrangeButton: View {
    var titleButton: String
    @State var isDisable: Bool = false
    var screenSize: ScreenSize
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: screenSize.scaleHeight(8))
                    .fill(Color.activeColor)
                Text(titleButton)
                    .foregroundStyle(.white)
                    .font(.yuGothicBold(size: screenSize.scaleHeight(14)))
            }
            .frame(width: screenSize.scaleWidth(335), height: screenSize.scaleHeight(48))
        }
        .disabled(isDisable)
    }
}

struct OrangeUIKitButton: View {
    var titleButton: String
    @State var isDisable: Bool = false
    var screenSize: ScreenSizeUIKit
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: screenSize.scaleHeight(8))
                    .fill(Color.activeColor)
                Text(titleButton)
                    .foregroundStyle(.white)
                    .font(.yuGothicBold(size: screenSize.scaleHeight(14)))
            }
            .frame(width: screenSize.scaleWidth(335), height: screenSize.scaleHeight(48))
        }
        .disabled(isDisable)
    }
}


//struct OrangeButton: View {
//    var title: String
//    var width: CGFloat
//    var height: CGFloat
//    var cornerRadius: CGFloat
//    var backgroundColor: Color
//    var foregroundColor: Color
//    var font: Font
//    var action: () -> Void
//
//    var body: some View {
//        Button(action: action) {
//            ZStack {
//                RoundedRectangle(cornerRadius: cornerRadius)
//                    .fill(backgroundColor)
//                Text(title)
//                    .foregroundColor(foregroundColor)
//                    .font(font)
//            }
//            .frame(width: width, height: height)
//        }
//    }
//}
