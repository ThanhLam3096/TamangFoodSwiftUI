//
//  HeaderHomeView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 21/5/25.
//

import SwiftUI

struct HeaderHomeView: View {
    let heightOfHeader: CGFloat
    let screenSize: ScreenSize
    @ObservedObject var viewModel: HeaderHomeViewVM
    @Binding var isExpanded: Bool
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        VStack {
            Text(AppFood.String.deliveryString)
                .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                .foregroundStyle(Color.activeColor)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundStyle(.red)
            ZStack {
                Button {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isExpanded.toggle()
//                        rotationAngle += 180
                    }
                    
                } label: {
                    HStack {
                        Text(viewModel.locationString)
                            .font(.yuGothicLight(size: screenSize.scaleHeight(20)))
                            .foregroundStyle(Color.mainColor)
                        Image(AppFood.StringImage.backDownIcon)
                            .rotationEffect(.degrees(isExpanded ? 180 : 0))
                                        .animation(.easeInOut(duration: 0.3), value: isExpanded)
//                            .rotationEffect(.degrees(rotationAngle))
                    }
                }

                HStack {
                    Spacer()
                    Text(AppFood.String.filterString)
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                        .foregroundStyle(Color.activeColor)
                }
            }
            .padding(.horizontal, screenSize.scaleWidth(20))
            CSpace(height: screenSize.scaleHeight(11))
            Color(hex: "#F6F6F6")
                .frame(height: 1)
        }
        .frame(height: heightOfHeader)
    }
}

#Preview {
    HeaderHomeView(heightOfHeader: 100, screenSize: ScreenSize(width: 375, height: 812), viewModel: HeaderHomeViewVM(), isExpanded: .constant(false))
}
