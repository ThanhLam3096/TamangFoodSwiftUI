//
//  InfoDetailMealView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/8/25.
//

import SwiftUI

struct InfoDetailMealView: View {
    let screenSize: ScreenSize
    
    var body: some View {
        Text("Sushi")
            .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
            .foregroundStyle(Color.blackColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, screenSize.scaleWidth(20))
        CSpace(height: screenSize.scaleHeight(10))
        HStack {
            Text("$$")
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                .foregroundStyle(Color.bodyTextColor)
            CSpace(width: screenSize.scaleWidth(10))
            Circle()
                .fill(Color.bodyTextColor)
                .frame(width: 5, height: 5)
            CSpace(width: screenSize.scaleWidth(10))
            Text("Chinese")
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                .foregroundStyle(Color.bodyTextColor)
            CSpace(width: screenSize.scaleWidth(15))
            Circle()
                .fill(Color.bodyTextColor)
                .frame(width: 5, height: 5)
            CSpace(width: screenSize.scaleWidth(10))
            Text("American")
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                .foregroundStyle(Color.bodyTextColor)
            CSpace(width: screenSize.scaleWidth(15))
            Circle()
                .fill(Color.bodyTextColor)
                .frame(width: 5, height: 5)
            CSpace(width: screenSize.scaleWidth(10))
            Text("Denshi Food")
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                .foregroundStyle(Color.bodyTextColor)
            Spacer()
        }
        .padding(.horizontal, screenSize.scaleWidth(20))
        CSpace(height: screenSize.scaleHeight(10))
        HStack {
            Text("4.3")
                .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                .foregroundStyle(Color.mainColor)
            CSpace(width: screenSize.scaleWidth(10))
            Image("Star")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: screenSize.scaleWidth(12))
            CSpace(width: screenSize.scaleWidth(10))
            Text("200+ rating")
                .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                .foregroundStyle(Color.mainColor)
            Spacer()
        }
        .padding(.horizontal, screenSize.scaleWidth(20))
        CSpace(height: screenSize.scaleHeight(25))
        HStack(alignment: .top) {
            HStack(alignment: .bottom) {
                Image("active")
                    .resizable()
                    .frame(width: screenSize.scaleWidth(18), height: screenSize.scaleHeight(24))
                Image("dollar")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: screenSize.scaleWidth(17))
                    .padding(.leading, -20)
            }
            CSpace(width: screenSize.scaleWidth(10))
            VStack(alignment: .leading, spacing: 4) {
                Text("Free")
                    .font(.yuGothicUILight(size: screenSize.scaleHeight(16)))
                    .foregroundStyle(Color.mainColor)
                Text("Delivery")
                    .font(.yuGothicUIRegular(size: screenSize.scaleHeight(12)))
                    .foregroundStyle(Color.mainColor)
            }
            CSpace(width: screenSize.scaleWidth(30))
            HStack(alignment: .bottom) {
                Image("active")
                    .resizable()
                    .frame(width: screenSize.scaleWidth(18), height: screenSize.scaleHeight(24))
                Image("timer")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: screenSize.scaleWidth(17))
                    .padding(.leading, -20)
            }
            CSpace(width: screenSize.scaleWidth(10))
            VStack(alignment: .leading, spacing: 4) {
                Text("25")
                    .font(.yuGothicUILight(size: screenSize.scaleHeight(16)))
                    .foregroundStyle(Color.mainColor)
                Text("Minutes")
                    .font(.yuGothicUIRegular(size: screenSize.scaleHeight(12)))
                    .foregroundStyle(Color.mainColor)
            }
            Spacer()
            Button(action: {
                print("Share")
            }, label: {
                Text("TAKE AWAY")
            })
            .frame(width: screenSize.scaleWidth(113), height: screenSize.scaleHeight(40))
            .buttonStyle(OutlineActiveButtonStyle(activeColor: .activeColor))
        }
        .padding(.horizontal, screenSize.scaleWidth(20))
    }
}

#Preview {
    InfoDetailMealView(screenSize: ScreenSize(width: 375, height: 812))
}
