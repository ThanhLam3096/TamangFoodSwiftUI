//
//  ChoiceSpiceView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 31/8/25.
//

import SwiftUI

struct ChoiceSpiceView: View {
    
    // MARK: Propertiers
    let screenSize: ScreenSize
    @ObservedObject var viewModel: ChoiceSpiceViewModel
    
    // MARK: Action
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                action()
            }) {
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color.clear)
                            .stroke(Color.bodyTextColor, lineWidth: 1)
                            .frame(width: screenSize.scaleWidth(24), height: screenSize.scaleWidth(24))
                        Circle()
                            .fill(viewModel.isSelectedSpice ? Color.activeColor : Color.clear)
                            .frame(width: screenSize.scaleWidth(18), height: screenSize.scaleWidth(18))
                    }
                    CSpace(width: screenSize.scaleWidth(10))
                    Text(viewModel.spice)
                        .mainUIRegularText(size: screenSize.scaleHeight(16))
                    Spacer()
                }
            }
            CSpace(height: screenSize.scaleHeight(14))
            Color(hex: "#F6F6F6")
                .frame(height: 1)
        }
    }
}

#Preview {
    ChoiceSpiceView(screenSize: ScreenSize(width: 375, height: 812), viewModel: ChoiceSpiceViewModel(spice: "Takayomi", isSelectedSpice: false), action: {})
}
