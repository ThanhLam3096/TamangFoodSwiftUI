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
    let screenSize: ScreenSizeUIKit
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: screenSize.scaleWidth(20)) {
                ForEach(viewModel.titleNationCategoryMeal.indices, id: \.self) { index in
                    let item = viewModel.titleNationCategoryMeal[index]
                    VStack {
                        Button(action: {
                            print(item)
                        }, label: {
                            AnimatedImage(imageName: viewModel.imageNationCategoryMeal[index], size: screenSize.scaleWidth(160))
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
    CateAndNationMealCollectionView(viewModel: CateAndNationMealCollectionViewModel(titleNationCategoryMeal: ["USA", "British", "Canadian", "China", "Croatian", "Dutch", "Egyptian", "Filipino", "France", "Greek", "Indian", "Irish", "Italian", "Jamaican", "Japan", "Kenyan", "Malaysian", "Mexican", "Moroccan", "Polish", "Portuguese", "Russia", "Spanish", "Thai", "Tunisian", "Turkish", "Ukrainian", "Unknown", "VietNam"], imageNationCategoryMeal: ["USA", "British", "Canadian", "China", "Croatian", "Dutch", "Egyptian", "Filipino", "France", "Greek", "Indian", "Irish", "Italian", "Jamaican", "Japan", "Kenyan", "Malaysian", "Mexican", "Moroccan", "Polish", "Portuguese", "Russia", "Spanish", "Thai", "Tunisian", "Turkish", "Ukrainian", "Unknown", "VietNam"]), screenSize: ScreenSizeUIKit(from: UIScreen.main.bounds.size))
}
