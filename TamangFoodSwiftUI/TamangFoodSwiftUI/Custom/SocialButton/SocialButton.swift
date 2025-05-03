//
//  SocialButton.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 3/5/25.
//

import SwiftUI

struct SocialButton: View {
    var socialType: SocialAccountType
    let screenSize: ScreenSize
    
    var body: some View {
        Button {
            print("Go To Connect Social Network")
        } label: {
            ZStack {
                // Background
                RoundedRectangle(cornerRadius: 8)
                    .fill(socialType.color)
                
                // Title centered
                Text(socialType.title)
                    .font(.yuGothicUISemibold(size: screenSize.scaleHeight(12)))
                    .foregroundColor(.white)
                
                // Icon leading
                HStack {
                    Image(socialType.rawValue)
                        .frame(width: screenSize.scaleHeight(28), height: screenSize.scaleHeight(28))
                        .padding(.leading, screenSize.scaleWidth(20))
                    Spacer()
                }
            }
        }
        .frame(height: screenSize.scaleHeight(44))
//        .padding(.horizontal, screenSize.scaleWidth(20))
    }
}

#Preview {
    SocialButton(socialType: .facebook,
                 screenSize: ScreenSize(width: 375, height: 812))
}
