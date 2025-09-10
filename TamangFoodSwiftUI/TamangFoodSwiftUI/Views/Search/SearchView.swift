//
//  SearchView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 19/6/25.
//

import SwiftUI

struct SearchView: View {
    // MARK: - Properties
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
    @ObservedObject private var keyboard = KeyboardResponder()
    let screenSize = ScreenSizeUIKit(from: UIScreen.main.bounds.size)
    
    var body: some View {
        ZStack {
            VStack {
                headerViewShow(screenSize: screenSize)
                HStack {
                    Button(action: {
                        
                    }) {
                        Text(AppFood.String.filterString)
                            .mainUIRegularText(size: screenSize.scaleHeight(16))
                    }
                    .frame(height: screenSize.scaleHeight(40))
                    .padding(.horizontal, screenSize.scaleWidth(10))
                    .background(Color.bodyTextColor.opacity(0.2))
                    .cornerRadius(8, corners: .allCorners)
                    CSpace(width: screenSize.scaleWidth(20))
                    Button(action: {
                        viewModel.isNation = true
                        viewModel.isSearchKey = false
                        fetchNationMeal()
                    }) {
                        Text(AppFood.String.nationString)
                            .mainUIRegularText(size: screenSize.scaleHeight(16))
                    }
                    .frame(height: screenSize.scaleHeight(40))
                    .padding(.horizontal, screenSize.scaleWidth(10))
                    .background(Color.accentColor.opacity(0.2))
                    .cornerRadius(8, corners: .allCorners)
                    CSpace(width: screenSize.scaleWidth(20))
                    Button(action: {
                        viewModel.isNation = false
                        viewModel.isSearchKey = false
                        fetchCategoryMeal()
                    }) {
                        Text(AppFood.String.categoryString)
                            .mainUIRegularText(size: screenSize.scaleHeight(16))
                    }
                    .frame(height: screenSize.scaleHeight(40))
                    .padding(.horizontal, screenSize.scaleWidth(10))
                    .background(Color.myAccentColor.opacity(0.2))
                    .cornerRadius(8, corners: .allCorners)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                CSpace(height: screenSize.scaleHeight(20))
                if viewModel.isSearchKey {
                    introduceSearchView(screenSize: screenSize)
                } else {
                    CateAndNationMealCollectionView(viewModel: CateAndNationMealCollectionViewModel( titleNationCategoryMeal: viewModel.titleNationCategoryMeal, imageNationCategoryMeal: viewModel.isNation ? viewModel.flagsNationMeal : viewModel.dishTypeMeal), screenSize: screenSize)
                }
            }
            .padding(.horizontal, screenSize.scaleWidth(20))
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            hideKeyboard()
        }
        
    }
    
    // MARK: ViewBuilder
    @ViewBuilder
    private func introduceSearchView(screenSize: ScreenSizeUIKit) -> some View {
        VStack {
            Text(AppFood.String.enterYourMealSearchString)
                .font(.yuGothicUISemibold(size: screenSize.scaleHeight(30)))
                .foregroundStyle(Color.myAccentColor)
                .multilineTextAlignment(.center)
            Image(AppFood.StringImage.emptySearchImage)
                .resizable()
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private func headerViewShow(screenSize: ScreenSizeUIKit) -> some View {
        if viewModel.isSearchKey {
            VStack {
                CSpace(height: screenSize.scaleHeight(20))
                HeaderSearchView(screenSize: screenSize)
                CSpace(height: screenSize.scaleHeight(20))
            }
            .frame(maxWidth: .infinity)
        } else {
            CSpace(height: screenSize.scaleHeight(20))
            HeaderFilterSearchView(screenSize: screenSize, action: {
                viewModel.isSearchKey = true
            })
            CSpace(height: screenSize.scaleHeight(20))
        }
    }
    
    // MARK: Function
    private func fetchNationMeal() {
        viewModel.getAPINationMeal { success, message in
            print(success ? "Load Data Nation Meal Success" : "Failed Nation: \(message)")
        }
    }
    
    private func fetchCategoryMeal() {
        viewModel.getAPICategoryMeal { success, message in
            print(success ? "Load Data Category Meal Success" : "Failed Nation: \(message)")
        }
    }
}

#Preview {
    SearchView()
}

