//
//  FilterSearchView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/9/25.
//

import SwiftUI

struct FilterSearchView: View {
    // MARK: - Properties
    @EnvironmentObject var router: MainNavigationRouter
    @ObservedObject var viewModel: FilterSearchViewModel
    
    var body: some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize(width: geometry.size.width, height: geometry.size.height)
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: screenSize.scaleHeight(20)) {
                        Section(header: HeaderForFilterSearchView(viewModel: HeaderFilterSearchViewModel(headerType: .nationHeader), screenSize: screenSize)) {
                            FlexibleWrapView(screenSize: screenSize, viewModel: FlexibleWrapViewModel(tags: viewModel.filterByNation, horizontalSpacing: 15, verticalSpacing: 20, paddingText: 10, listFilterChoice: viewModel.choosingNation), action: { valueNation in
                                viewModel.filterSearch(valueNation, for: .nationHeader)
                            })
                        }
                        Section(header: HeaderForFilterSearchView(viewModel: HeaderFilterSearchViewModel(headerType: .categoryHeader), screenSize: screenSize)) {
                            FlexibleWrapView(screenSize: screenSize, viewModel: FlexibleWrapViewModel(tags: viewModel.filterByCategory, horizontalSpacing: 15, verticalSpacing: 20, paddingText: 10, listFilterChoice: viewModel.choosingCategories), action: { valueCategory in
                                viewModel.filterSearch(valueCategory, for: .categoryHeader)
                            })
                        }
                        Section(header: HeaderForFilterSearchView(viewModel: HeaderFilterSearchViewModel(headerType: .priceRangeHeader), screenSize: screenSize)) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: screenSize.scaleWidth(10)) {
                                    ForEach(viewModel.filterByPriceRange, id: \.self) { price in
                                        Button(action: {
                                            viewModel.filterSearch(price, for: .priceRangeHeader)
                                        }, label: {
                                            Text(price)
                                                .font(.yuGothicUISemibold(size: screenSize.scaleHeight(14)))
                                                .foregroundStyle(viewModel.choosingPriceRange.contains(price) ? Color.bgColor : Color.bodyTextColor)
                                                .frame(width: screenSize.scaleHeight(64), height: screenSize.scaleHeight(64))
                                                .background(viewModel.choosingPriceRange.contains(price) ? Color.myAccentColor : Color.init(hex: "F1F1F1"))
                                                .cornerRadius(screenSize.scaleHeight(32))
                                        })
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, screenSize.scaleWidth(20))
        }
        .navigationTitle(Text(AppFood.String.filterString))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    router.dismissSheet()
                    print("dismiss")
                }) {
                    Image(AppFood.StringImage.backButton)
                }
            }
        }
    }
}

#Preview {
    FilterSearchView(viewModel: FilterSearchViewModel(filterByNation: ["USA", "British", "Canadian", "China", "Croatian", "Dutch", "Egyptian", "Filipino", "France", "Greek", "Indian", "Irish", "Italian", "Jamaican", "Japan", "Kenyan", "Malaysian", "Mexican", "Moroccan", "Polish", "Portuguese", "Russia", "Spanish", "Thai", "Tunisian", "Turkish", "Ukrainian", "Uruguay", "VietNam"], filterByCategory: ["Beef", "Breakfast", "Chicken", "Dessert", "Goat", "Lamb", "Miscellaneous", "Pasta", "Pork", "Seafood", "Side", "Starter", "Vegan", "Vegetarian"]))
}
