//
//  DetailViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/8/25.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published var typeMeal: [String] = ["Beef", "Breakfast", "Chicken", "Dessert", "Goat", "Lamb", "Miscellaneous", "Pasta", "Pork", "Seafood", "Side", "Starter", "Vegan", "Vegetarian"]
    
    @Published var listMealByCategory: [TheMealDB] = []
    @Published var mealDetail: TheMealDB?
    
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
}
