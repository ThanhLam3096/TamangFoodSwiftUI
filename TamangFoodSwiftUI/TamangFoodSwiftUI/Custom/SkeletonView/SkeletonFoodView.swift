//
//  SkeletonView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 25/8/25.
//

import SwiftUI
import Shimmer

struct SkeletonFoodView: View {
    let screenSize: ScreenSize
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.clear)
            .frame(width: screenSize.scaleWidth(200), height: screenSize.scaleHeight(254))
            .overlay(
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: screenSize.scaleWidth(200) ,height: screenSize.scaleHeight(160))
                        .shimmering(config: ShimmerConfig(
                            tint: .gray.opacity(0.2),
                            highlight: .blue,
                            blur: 2,
                            highlightOpacity: 0.1,
                            speed: 4
                        ))
                    CSpace(height: screenSize.scaleHeight(10))
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: screenSize.scaleWidth(150) ,height: screenSize.scaleHeight(20))
                        .shimmering(config: ShimmerConfig(
                            tint: .gray.opacity(0.2),
                            highlight: .blue,
                            blur: 2,
                            highlightOpacity: 0.1,
                            speed: 4
                        ))
                    CSpace(height: screenSize.scaleHeight(5))
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: screenSize.scaleWidth(200) ,height: screenSize.scaleHeight(16))
                        .shimmering(config: ShimmerConfig(
                            tint: .gray.opacity(0.2),
                            highlight: .blue,
                            blur: 2,
                            highlightOpacity: 0.1,
                            speed: 4
                        ))
                    CSpace(height: screenSize.scaleHeight(10))
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: screenSize.scaleWidth(200) ,height: screenSize.scaleHeight(14))
                        .shimmering(config: ShimmerConfig(
                            tint: .gray.opacity(0.2),
                            highlight: .blue,
                            blur: 2,
                            highlightOpacity: 0.1,
                            speed: 4
                        ))
                }
            )
//            .shimmering(active: true)
    }
}

#Preview {
    SkeletonFoodView(screenSize: ScreenSize(width: 375, height: 812))
}
