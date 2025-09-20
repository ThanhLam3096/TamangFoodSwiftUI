//
//  HeaderForFilterSearchView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 17/9/25.
//

import SwiftUI

struct HeaderForFilterSearchView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: HeaderFilterSearchViewModel
    let screenSize: ScreenSize
    
    var body: some View {
        HStack {
            Text(viewModel.headerType.title)
                .font(.yuGothicUISemibold(size: screenSize.scaleHeight(14)))
                .foregroundStyle(Color.mainColor)
            Spacer()
            Button(action: {
                print("abcd")
            }, label: {
                Text(AppFood.String.clearAllButtonTitle)
                    .font(.yuGothicUILight(size: screenSize.scaleHeight(14)))
                    .foregroundStyle(Color.mainColor)
            })
        }
    }
}

#Preview {
    HeaderForFilterSearchView(viewModel: HeaderFilterSearchViewModel(headerType: .nationHeader),screenSize: ScreenSize(width: 375, height: 812))
}
