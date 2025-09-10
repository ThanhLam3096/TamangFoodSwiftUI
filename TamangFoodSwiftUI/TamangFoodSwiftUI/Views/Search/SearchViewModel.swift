//
//  SearchViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 9/9/25.
//

import Foundation

final class SearchViewModel: ObservableObject {
    let flagsNationMeal = ["USA", "British", "Canadian", "China", "Croatian", "Dutch", "Egyptian", "Filipino", "France", "Greek", "Indian", "Irish", "Italian", "Jamaican", "Japan", "Kenyan", "Malaysian", "Mexican", "Moroccan", "Polish", "Portuguese", "Russia", "Spanish", "Thai", "Tunisian", "Turkish", "Ukrainian", "Uruguay", "VietNam"]
    let dishTypeMeal = ["Beef", "Breakfast", "Chicken", "Dessert", "Goat", "Lamb", "Miscellaneous", "Pasta", "Pork", "Seafood", "Side", "Starter", "Vegan", "Vegetarian"]
    @Published var isNation = true
    @Published var isSearchKey = true
    @Published var titleNationCategoryMeal: [String] = []
    
    func getAPINationMeal(nationMealCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getNationMeal { [weak self] (nationMealResult) in
            guard let this = self else { return }
            this.titleNationCategoryMeal = []
            switch nationMealResult {
            case .failure(let error):
                this.titleNationCategoryMeal = this.dishTypeMeal
                nationMealCompletion(false, error)
            case .success(let result):
                let items = result.meals
                for item in items {
                    this.titleNationCategoryMeal.append(item.area)
                }
                nationMealCompletion(true, AppFood.String.loadSuccess)
            }
        }
    }
    
    func getAPICategoryMeal(nationMealCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getCategoryMeal { [weak self] (nationMealResult) in
            guard let this = self else { return }
            this.titleNationCategoryMeal = []
            switch nationMealResult {
            case .failure(let error):
                this.titleNationCategoryMeal = this.flagsNationMeal
                nationMealCompletion(false, error)
            case .success(let result):
                let items = result.meals
                for item in items {
                    this.titleNationCategoryMeal.append(item.category)
                }
                nationMealCompletion(true, AppFood.String.loadSuccess)
            }
        }
    }
}
