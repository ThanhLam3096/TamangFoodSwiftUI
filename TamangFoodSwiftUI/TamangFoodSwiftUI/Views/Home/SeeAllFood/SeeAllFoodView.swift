//
//  SeeAllFoodView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 19/6/25.
//

import SwiftUI

struct SeeAllFoodView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @ObservedObject var viewModel: SeeAllFoodViewModel
    @EnvironmentObject var router: NavigationRouter
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize(width: geometry.size.width, height: geometry.size.height)
            VStack {
                NavigationBarView(screenSize: screenSize, title: viewModel.title) {
                    router.goBack()
                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: screenSize.scaleWidth(15)) {
                        ForEach(viewModel.meals, id: \.idMeal) { item in
                            VStack {
                                SeeAllFoodItemView(screenSize: screenSize, viewModel: SeeAllFoodItemViewModel(meal: item))
                            }
                        }
                    }
                    .padding(.horizontal, screenSize.scaleWidth(20))
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SeeAllFoodView(viewModel: SeeAllFoodViewModel(meals: dummyMealFeaturePartnes.featurePartnesMeal, title: "Hehe"))
}
