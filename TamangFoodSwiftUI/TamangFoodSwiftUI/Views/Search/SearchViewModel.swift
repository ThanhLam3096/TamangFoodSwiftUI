//
//  SearchViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 9/9/25.
//

import Foundation

final class SearchViewModel: ObservableObject {
    // MARK: Properties
    let flagsNationMeal = ["USA", "British", "Canadian", "China", "Croatian", "Dutch", "Egyptian", "Filipino", "France", "Greek", "Indian", "Irish", "Italian", "Jamaican", "Japan", "Kenyan", "Malaysian", "Mexican", "Moroccan", "Polish", "Portuguese", "Russia", "Spanish", "Thai", "Tunisian", "Turkish", "Ukrainian", "Uruguay", "VietNam"]
    let dishTypeMeal = ["Beef", "Breakfast", "Chicken", "Dessert", "Goat", "Lamb", "Miscellaneous", "Pasta", "Pork", "Seafood", "Side", "Starter", "Vegan", "Vegetarian"]
    @Published var isNation = true
    @Published var isSearchKey = true
    @Published var isSearchResultKey = false
    @Published var titleNationCategoryMeal: [String] = []
    @Published var listResultSearchMealByName: [TheMealDB] = []
    @Published var mealDetail: Meal?
    
    // MARK: Calling API Function
    func getAPISearchMealDB(name: String, detailMealCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getMealByName(nameMeal: name) { [weak self] (mealSearchResult) in
            guard let this = self else { return }
            this.listResultSearchMealByName.removeAll()
            switch mealSearchResult {
            case .failure(let error):
                detailMealCompletion(false, error)
            case .success(let result):
                let items = result.meals
                this.listResultSearchMealByName = items
                detailMealCompletion(true, AppFood.String.loadSuccess)
            }
        }
    }
    
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
    
    func getAPIMealByNation(nationName: String, listCategoryNameMealCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getListMealByNation(nationName: nationName) { [weak self] (mealResult) in
            guard let this = self else { return }
            this.listResultSearchMealByName.removeAll()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                switch mealResult {
                case .failure(let error):
                    listCategoryNameMealCompletion(false, error)
                case .success(let result):
                    
                    for item in result.meals {
                        this.listResultSearchMealByName.append(item)
                    }
                    listCategoryNameMealCompletion(true, AppFood.String.loadSuccess)
                }
            }
        }
    }
    
    func getAPIMealByCategory(categoryName: String, listCategoryNameMealCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getListMealByCategory(categoryName: categoryName) { [weak self] (mealResult) in
            guard let this = self else { return }
            this.listResultSearchMealByName.removeAll()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                switch mealResult {
                case .failure(let error):
                    listCategoryNameMealCompletion(false, error)
                case .success(let result):
                    for item in result.meals {
                        this.listResultSearchMealByName.append(item)
                    }
                    listCategoryNameMealCompletion(true, AppFood.String.loadSuccess)
                }
            }
        }
    }
    
    func getAPIDetailMealDB(idMeal: String, detailMealCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getDetailMeal(idMeal: idMeal) { [weak self] (mealDetailResult) in
            guard let this = self else { return }
            switch mealDetailResult {
            case .failure(let error):
                detailMealCompletion(false, error)
            case .success(let result):
                let items = result.meals
                for item in items{
                    this.mealDetail = DetailFollowThemeMealDB().setDetailDataForThemeMealDB(themeMealDB: item)
                    print("Meal Detail \(String(describing: this.mealDetail?.name))")
                }
                detailMealCompletion(true, AppFood.String.loadSuccess)
            }
        }
    }
    
}
