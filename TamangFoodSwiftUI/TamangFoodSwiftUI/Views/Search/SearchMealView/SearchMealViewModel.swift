//
//  SearchMealViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 13/9/25.
//

import Foundation

final class SearchMealViewModel: ObservableObject {
     var historySearchMeal: [String] = ["Pizza", "Sushi", "Takoyaki", "Beef Hamilton"]
    @Published var mealSearch: String = ""
    
    init(mealSearch: String) {
        self.mealSearch = mealSearch
    }
}
