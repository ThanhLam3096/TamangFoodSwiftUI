//
//  PageView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 26/4/25.
//

import SwiftUI

struct PageIndicator: View {
    let currentPage: Int
    var screenSize: ScreenSize
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                RoundedRectangle(cornerRadius: screenSize.scaleHeight(2))
                    .frame(width: screenSize.scaleWidth(8), height: screenSize.scaleHeight(5))
                    .foregroundColor(index == currentPage ? Color.greenColor : Color.bodyTextColor)
                    .animation(.easeInOut(duration: 0.3), value: currentPage)
            }
        }
    }
}

//#Preview {
//    PageView(currentPage: 0, screenSize: <#ScreenSize#>)
//}
