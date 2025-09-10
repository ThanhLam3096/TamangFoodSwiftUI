//
//  HeaderFilterSearchView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 10/9/25.
//

import SwiftUI

struct HeaderFilterSearchView: View {
    
    // MARK: - Properties
    let screenSize: ScreenSizeUIKit
    let action: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                action()
            }, label: {
                Image(AppFood.StringImage.searchIcon)
                    .resizable()
                    .frame(width: screenSize.scaleHeight(24), height: screenSize.scaleHeight(24))
            })
            CSpace(width: screenSize.scaleWidth(20))
            Text(AppFood.String.searchTitle)
                .font(.yuGothicUISemibold(size: screenSize.scaleHeight(28)))
                .foregroundStyle(Color.mainColor)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HeaderFilterSearchView(screenSize: ScreenSizeUIKit(from: UIScreen.main.bounds.size), action: {})
}
