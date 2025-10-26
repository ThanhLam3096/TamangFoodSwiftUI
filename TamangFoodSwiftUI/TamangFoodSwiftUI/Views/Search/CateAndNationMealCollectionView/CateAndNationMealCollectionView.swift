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
    let action: (TypeMeal, String) -> Void
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: screenSize.scaleWidth(20)) {
                ForEach(viewModel.titleNationCategoryMeal.indices, id: \.self) { index in
                    let item = viewModel.titleNationCategoryMeal[index]
                    VStack {
                        Button(action: {
                            action(viewModel.typeMeal, viewModel.titleNationCategoryMeal[index])
                        }, label: {
                            AnimatedImage(imageName: viewModel.imageNationCategoryMeal[index], size: screenSize.scaleWidth(160), isURLImage: false)
                                .cornerRadius(8, corners: .allCorners)
                                .overlay(
                                    ZStack {
                                        Color.mainColor.opacity(0.4)
                                        Text(item)
                                            .font(.yuGothicUILight(size: screenSize.scaleHeight(20)))
                                            .foregroundColor(Color.bgColor)
                                    }
                                        .cornerRadius(8, corners: .allCorners)
                                )
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
    CateAndNationMealCollectionView(viewModel: CateAndNationMealCollectionViewModel(titleNationCategoryMeal: ["USA", "British", "Canadian", "China", "Croatian", "Dutch", "Egyptian", "Filipino", "France", "Greek", "Indian", "Irish", "Italian", "Jamaican", "Japan", "Kenyan", "Malaysian", "Mexican", "Moroccan", "Polish", "Portuguese", "Russia", "Spanish", "Thai", "Tunisian", "Turkish", "Ukrainian", "Unknown", "VietNam"], imageNationCategoryMeal: ["USA", "British", "Canadian", "China", "Croatian", "Dutch", "Egyptian", "Filipino", "France", "Greek", "Indian", "Irish", "Italian", "Jamaican", "Japan", "Kenyan", "Malaysian", "Mexican", "Moroccan", "Polish", "Portuguese", "Russia", "Spanish", "Thai", "Tunisian", "Turkish", "Ukrainian", "Unknown", "VietNam"], typeMeal: .nation), screenSize: ScreenSizeUIKit(from: UIScreen.main.bounds.size), action: {_,_ in })
}
