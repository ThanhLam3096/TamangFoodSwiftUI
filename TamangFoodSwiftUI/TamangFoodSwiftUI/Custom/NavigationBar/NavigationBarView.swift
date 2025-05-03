//
//  NavigationBarView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 27/4/25.
//

import SwiftUI

struct NavigationBarView: View {
    var screenSize: ScreenSize
    var title: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                print("Button tapped")
            }) {
                Image("back")
                //     .resizable()
                    .frame(width: screenSize.scaleWidth(24), height: screenSize.scaleWidth(24))
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: screenSize.scaleWidth(24), height: screenSize.scaleWidth(24))
//            .background(.red)
            Spacer()
            Text(title)
                .font(.headline)
                .foregroundColor(Color.mainColor)
            
            Spacer()
            Color.clear
                .frame(width: screenSize.scaleWidth(24), height: screenSize.scaleWidth(24))
        }
        .padding(.horizontal)
    }
}

