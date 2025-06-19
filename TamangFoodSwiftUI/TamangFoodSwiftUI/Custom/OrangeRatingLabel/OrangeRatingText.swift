//
//  OrangeRatingText.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 17/6/25.
//

import SwiftUI

struct OrangeRatingText: View {
    let screenSize: ScreenSize
    @ObservedObject var viewModel: OrangeRatingTextViewModel
    
    var body: some View {
        Text(viewModel.rating)
            .font(.yuGothicUISemibold(size: screenSize.scaleHeight(12)))
            .frame(width: screenSize.scaleWidth(36), height: screenSize.scaleHeight(20), alignment: .center)
            .background(Color.activeColor)
            .foregroundStyle(Color.bgColor)
            .cornerRadius(4, corners: .allCorners)
    }
}

#Preview {
    OrangeRatingText(screenSize: ScreenSize(width: 375, height: 812), viewModel: OrangeRatingTextViewModel(rating: "4.5"))
}
