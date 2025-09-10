//
//  CateAndNationMealCollectionView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 9/9/25.
//

import SwiftUI

struct CateAndNationMealCollectionView: View {
    // MARK: - Properties
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @ObservedObject var viewModel: CateAndNationMealCollectionViewModel
    let screenSize: ScreenSize
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: screenSize.scaleWidth(20)) {
                ForEach(viewModel.isNation ? viewModel.flagsNationMeal : viewModel.dishTypeMeal, id: \.self) { item in
                    VStack {
                        Button(action: {
                            print(item)
                        }, label: {
                            AnimatedImage(imageName: item, size: screenSize.scaleWidth(160))
                                .overlay(
                                    ZStack {
                                        Color.mainColor.opacity(0.4).cornerRadius(8)
                                        Text(item)
                                            .font(.yuGothicUILight(size: screenSize.scaleHeight(20)))
                                            .foregroundColor(Color.bgColor)
                                    })
                        })
                        .onAppear {
                            // Call Back Animation
                            NotificationCenter.default.post(
                                name: .replayAnimation,
                                object: item
                            )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CateAndNationMealCollectionView(viewModel: CateAndNationMealCollectionViewModel(isNation: true), screenSize: ScreenSize(width: 375, height: 812))
}
