//
//  HeaderSpiceView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 31/8/25.
//

import SwiftUI

struct HeaderSpiceView: View {
    
    // MARK: Propertiers
    let screenSize: ScreenSize
    @ObservedObject var viewModel: HeaderSpiceViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.titleHeader)
                .font(.yuGothicLight(size: screenSize.scaleHeight(20)))
            Spacer()
            Button(action: {}, label: {
                Text("REQUIRED")
                    .font(.yuGothicLight(size: screenSize.scaleHeight(12)))
                    .foregroundStyle(viewModel.data.isEmpty ? Color.bgColor : Color.myAccentColor)
            })
            .frame(width: screenSize.scaleWidth(90), height: screenSize.scaleHeight(32))
            .background(viewModel.data.isEmpty ? Color.activeColor : Color.activeColor.opacity(0.3))
            .cornerRadius(5, corners: .allCorners)
        }
    }
}

#Preview {
    HeaderSpiceView(screenSize: ScreenSize(width: 375, height: 812), viewModel: HeaderSpiceViewModel(titleHeader: "Choice of Top Spice", data: ""))
}
