//
//  IntroducePage.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 26/4/25.
//

import SwiftUI

struct IntroducePage: View {
    let imageIntroduce: String
    let titleIntroduce: String
    let descriptionIntroduce: String
    let page: Int
    let onTapButton: (() -> Void)
    
    var body: some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize(width: geometry.size.width, height: geometry.size.height)
            ZStack {
                VStack {
                    CSpace(height: screenSize.scaleHeight(95))
                    HStack(alignment: .top) {
                        CSpace(width: screenSize.scaleWidth(20))
                        Image("logo_tamano")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: screenSize.scaleWidth(65), height: screenSize.scaleWidth(65))
                        CSpace(width: screenSize.scaleWidth(10))
                        Text("Tamang\nFoodService")
                            .font(.yuGothicBold(size: screenSize.scaleHeight(37)))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.blackColor)
                            .lineLimit(2)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: screenSize.scaleWidth(75))
                    CSpace(height: screenSize.scaleHeight(64))
                    Image(imageIntroduce)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screenSize.scaleWidth(264), height: screenSize.scaleWidth(264))
                    CSpace(height: screenSize.scaleHeight(20))
                    Text(titleIntroduce)
                        .font(.yuGothicLight(size: screenSize.scaleHeight(32)))
                        .foregroundStyle(Color.mainColor)
                    CSpace(height: screenSize.scaleHeight(20))
                    Text(descriptionIntroduce)
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                        .foregroundStyle(Color.bodyTextColor)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(.horizontal, screenSize.scaleWidth(20))
                        .fixedSize(horizontal: false, vertical: true)
                    CSpace(height: screenSize.scaleHeight(27.5))
                    PageIndicator(currentPage: page, screenSize: screenSize)
                    CSpace(height: screenSize.scaleHeight(27.5))
                    OrangeButton(titleButton: "GET STARTED", screenSize: screenSize) {
                        onTapButton()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .frame(width: screenSize.width, height: screenSize.height)
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

