//
//  LoadingWaitingSearchView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 11/9/25.
//

import SwiftUI

struct LoadingWaitingSearchView: View {
    let screenSize: ScreenSizeUIKit
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.clear)
            .frame(width: screenSize.scaleWidth(160), height: screenSize.scaleHeight(200))
            .overlay(
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: screenSize.scaleWidth(160) ,height: screenSize.scaleHeight(160))
                        .shimmering(config: ShimmerConfig(
                            tint: .gray.opacity(0.2),
                            highlight: .blue,
                            blur: 2,
                            highlightOpacity: 0.1,
                            speed: 4
                        ))
                    CSpace(height: screenSize.scaleHeight(10))
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: screenSize.scaleWidth(160) ,height: screenSize.scaleHeight(16))
                        .shimmering(config: ShimmerConfig(
                            tint: .gray.opacity(0.2),
                            highlight: .blue,
                            blur: 2,
                            highlightOpacity: 0.1,
                            speed: 4
                        ))
                }
            )
    }
}

#Preview {
    LoadingWaitingSearchView(screenSize: ScreenSizeUIKit(from: UIScreen.main.bounds.size))
}
