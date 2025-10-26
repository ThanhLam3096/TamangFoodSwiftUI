//
//  HeaderSearchView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 9/9/25.
//

import SwiftUI

struct HeaderSearchView: View {
    // MARK: - Properties
    let screenSize: ScreenSizeUIKit
    @Binding var searchText: String
    @FocusState private var isFocused: Bool
    let action: () -> Void
    
    var body: some View {
        Text(AppFood.String.searchTitle)
            .font(.yuGothicUISemibold(size: screenSize.scaleHeight(28)))
            .foregroundStyle(Color.mainColor)
            .frame(maxWidth: .infinity, alignment: .leading)
        HStack {
            Image(AppFood.StringImage.searchIcon)
                .resizable()
                .frame(width: screenSize.scaleHeight(14), height: screenSize.scaleHeight(14))
                .padding(.leading, screenSize.scaleWidth(20))
                .padding(.trailing, screenSize.scaleWidth(10))
            TextField(AppFood.String.placeHolderSearchTextField, text: $searchText)
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                .foregroundStyle(Color.mainColor)
                .tint(Color.myAccentColor)
                .frame(height: screenSize.scaleHeight(54))
                .focused($isFocused)
                .onChange(of: isFocused) { oldValue, newValue in                  action()
                }
        }
        .frame(height: screenSize.scaleHeight(54))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: screenSize.scaleHeight(8))
                .stroke(Color.bodyTextColor.opacity(0.3), lineWidth: 1)
                .background(Color.bodyTextColor.opacity(0.132))
        )
        .cornerRadius(8, corners: .allCorners)
    }
}

#Preview {
    StatefulPreviewWrapper("") { text in
        HeaderSearchView(
            screenSize: ScreenSizeUIKit(from: UIScreen.main.bounds.size),
            searchText: text,
            action: {}
        )
    }
}
