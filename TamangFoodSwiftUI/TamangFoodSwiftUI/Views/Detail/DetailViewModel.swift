//
//  DetailViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/8/25.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published var typeMeal: [String] = ["Beef", "Breakfast", "Chicken", "Dessert", "Goat", "Lamb", "Miscellaneous", "Pasta", "Pork", "Seafood", "Side", "Starter", "Vegan", "Vegetarian"]
    @Published var meal: Meal
    @Published var listMealByCategory: [TheMealDB] = []
    @Published var mealDetail: TheMealDB?
    @Published var isLoadingCategory = false
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    func getAPIListMealByCategory(categoryName: String, listMealByCategoryCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getListMealByCategory(categoryName: categoryName) { [weak self] (mealResult) in
            guard let this = self else { return }
            switch mealResult {
            case .failure(let error):
                listMealByCategoryCompletion(false, error)
            case .success(let result):
                this.listMealByCategory.removeAll()
                for item in result.meals {
                    this.listMealByCategory.append(item)
                }
                listMealByCategoryCompletion(true, AppFood.String.loadSuccess)
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
                    this.mealDetail = item
                }
                detailMealCompletion(true, AppFood.String.loadSuccess)
            }
        }
    }
}
