//
//  FooterListSpiceView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 3/9/25.
//

import SwiftUI

struct FooterListSpiceView: View {
    // MARK: Propertiers
    let screenSize: ScreenSize
    
    var body: some View {
        VStack {
            HStack {
                Text("Add Special Instructions")
                    .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                    .foregroundStyle(Color.mainColor)
                Spacer()
                Button(action: {
                    
                }) {
                    Image("right_arrow")
                }
            }
        }
        CSpace(height: screenSize.scaleHeight(14))
        Color(hex: "#F6F6F6")
            .frame(height: 1)
    }
}

#Preview {
    FooterListSpiceView(screenSize: ScreenSize(width: 375, height: 812))
}
