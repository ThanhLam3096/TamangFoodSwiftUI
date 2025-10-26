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
    @State var isSearchMeal: Bool = false
    @State var myMealSearch: String = ""
    @EnvironmentObject var router: MainNavigationRouter
    
    var body: some View {
        ZStack {
            VStack {
                headerViewShow(screenSize: screenSize)
                HStack {
                    Button(action: {
                        router.presentSheet(.filterSearch(nations: viewModel.flagsNationMeal, categories: viewModel.dishTypeMeal))
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
                    searchResultView(screenSize: screenSize)
                } else {
                    CateAndNationMealCollectionView(viewModel: CateAndNationMealCollectionViewModel( titleNationCategoryMeal: viewModel.titleNationCategoryMeal, imageNationCategoryMeal: viewModel.isNation ? viewModel.flagsNationMeal : viewModel.dishTypeMeal, typeMeal: viewModel.isNation ? .nation : .category), screenSize: screenSize, action: {typeMeal, selectedString  in
                        viewModel.isNation = false
                        viewModel.isSearchKey = true
                        handleWhenTappingItemOnNationAndCategory(typeMeal: typeMeal, selectedItem: selectedString)
                        
                    })
                }
            }
            .padding(.horizontal, screenSize.scaleWidth(20))
            .hidden(isSearchMeal)
            SearchMealView(screenSize: screenSize, viewModel: SearchMealViewModel(mealSearch: myMealSearch), actionCancelSearch: {
                isSearchMeal = false
            }, actionSearch: {mealSearch in
                myMealSearch = mealSearch
                isSearchMeal = false
                fetchSearchMealByName(name: mealSearch)
            })
                .hidden(!isSearchMeal)
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    // MARK: ViewBuilder
    @ViewBuilder
    private func searchResultView(screenSize: ScreenSizeUIKit) -> some View {
        if viewModel.isSearchResultKey {
            ResultSearchView(viewModel: ResultSearchViewModel(meals: viewModel.listResultSearchMealByName), screenSize: screenSize)
        } else {
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
    }
    
    @ViewBuilder
    private func headerViewShow(screenSize: ScreenSizeUIKit) -> some View {
        if viewModel.isSearchKey {
            VStack {
                CSpace(height: screenSize.scaleHeight(20))
                HeaderSearchView(screenSize: screenSize, searchText: $myMealSearch ,action: {
                    isSearchMeal = true
                })
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
    private func fetchSearchMealByName(name: String) {
        viewModel.getAPISearchMealDB(name: name) { success, message in
            print(success ? "Load API Search Meal" : "Failed Search Loading: \(message)")
            viewModel.isSearchResultKey = true
        }
    }
    
    private func fetchNationMeal() {
        viewModel.getAPINationMeal { success, message in
            print(success ? "Load Data Nation Meal Success" : "Failed Loading: \(message)")
        }
    }
    
    private func fetchCategoryMeal() {
        viewModel.getAPICategoryMeal { success, message in
            print(success ? "Load Data Category Meal Success" : "Failed Loading: \(message)")
        }
    }
    
    private func handleWhenTappingItemOnNationAndCategory(typeMeal: TypeMeal, selectedItem: String) {
        switch typeMeal {
        case .nation:
            fetchMealByNation(nationName: selectedItem)
        case .category:
            fetchMealByCategory(categoryName: selectedItem)
        }
        viewModel.isSearchResultKey = true
    }
    
    private func fetchMealByNation(nationName: String) {
        viewModel.getAPIMealByNation(nationName: nationName) { success, message in
            print(success ? "Load Data Meal By Success" : "Failed Loading: \(message)")
        }
    }
    
    private func fetchMealByCategory(categoryName: String) {
        viewModel.getAPIMealByCategory(categoryName: categoryName) { success, message in
            print(success ? "Load Data Category Meal Success" : "Failed Loading: \(message)")
        }
    }
}

#Preview {
    SearchView()
}

