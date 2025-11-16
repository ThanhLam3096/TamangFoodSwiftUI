//
//  ResultSearchView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 10/9/25.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftUIIntrospect

struct ResultSearchView: View {
    // MARK: - Properties
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @ObservedObject var viewModel: ResultSearchViewModel
    @EnvironmentObject var router: MainNavigationRouter
    let screenSize: ScreenSizeUIKit
    let action: (String) -> Void
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: screenSize.scaleWidth(20)) {
                if viewModel.meals.isEmpty {
                    ForEach(0..<9, id: \.self) { _ in
                        LoadingWaitingSearchView(screenSize: screenSize)
                    }
                } else {
                    ForEach(viewModel.meals, id: \.idMeal) { item in
                        VStack {
                            Button(action: {
                                action(item.idMeal)
                            }, label: {
                                AnimatedImage(imageName: item.imageMeal, size: screenSize.scaleWidth(160), isURLImage: true)
//                                WebImage(url: URL(string: item.imageMeal))
//                                    .resizable()
//                                    .frame(width: screenSize.scaleWidth(160), height: screenSize.scaleWidth(160))
//                                    .cornerRadius(8, corners: .allCorners)
                            })
                            .onAppear {
                                // Call Back Animation
                                NotificationCenter.default.post(
                                    name: .replayAnimation,
                                    object: item
                                )
                            }
                            CSpace(height: screenSize.scaleHeight(10))
                            Text(item.nameMeal)
                                .font(.yuGothicUILight(size: screenSize.scaleHeight(16)))
                                .foregroundColor(Color.mainColor)
                        }
                        .frame(width: screenSize.scaleWidth(160), height: screenSize.scaleHeight(200))
                    }
                }
            }
        }
        .customScrollIndicator(color: UIKitColor.greenColor, width: 4)
    }
}
