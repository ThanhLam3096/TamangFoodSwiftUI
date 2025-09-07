//
//  Welcome.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 8/4/25.
//

import SwiftUI

struct Welcome: View {
    // MARK: - Properties
    @EnvironmentObject var router: AuthNavigationRouter
    
    var body: some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize(width: geometry.size.width, height: geometry.size.height)
            ZStack {
                Circle()
                    .fill(Color.myAccentColor.opacity(0.3))
                    .frame(width: screenSize.scaleHeight(437), height: screenSize.scaleHeight(437))
                    .offset(x: -(screenSize.scaleWidth(110)), y: -(screenSize.scaleHeight(249)))
                    .ignoresSafeArea()
                    .zIndex(-1)
                VStack {
                    CSpace(height: screenSize.scaleHeight(75))
                    HStack(alignment: .top) {
                        CSpace(width: screenSize.scaleWidth(20))
                        Image(AppFood.StringImage.iconTamago)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: screenSize.scaleWidth(65), height: screenSize.scaleWidth(65))
                        CSpace(width: screenSize.scaleWidth(10))
                        Text(AppFood.String.titleWelcome)
                            .font(.yuGothicBold(size: screenSize.scaleHeight(37)))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.bodyTextColor)
                            .lineLimit(2)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: screenSize.scaleWidth(75))
                    CSpace(height: screenSize.scaleHeight(54))
                    Image(AppFood.StringImage.welcomeImage)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screenSize.scaleWidth(213), height: screenSize.scaleHeight(243))
                    CSpace(height: screenSize.scaleHeight(41))
                    Text(AppFood.String.welcome)
                        .font(.yuGothicBold(size: screenSize.scaleHeight(28)))
                        .foregroundStyle(Color.titleColor)
                    CSpace(height: screenSize.scaleHeight(20))
                    Text(AppFood.String.contentWelcome)
                        .font(.yuGothicMedium(size: screenSize.scaleHeight(16)))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.titleColor)
                        .padding(.horizontal, screenSize.scaleWidth(20))
                    CSpace(height: screenSize.scaleHeight(60))
                    OrangeButton(titleButton: AppFood.String.orangeTitleButtonWelcome, screenSize: screenSize) {
                        router.push(.pageNumber)
                    }
                }
                .frame(width: screenSize.width)
            }
            .frame(width: screenSize.width, height: screenSize.height)
        }
    }
}

#Preview {
    Welcome()
}
