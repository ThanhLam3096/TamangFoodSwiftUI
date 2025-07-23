//
//  SeeAllFoodViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 20/6/25.
//

import Foundation

final class SeeAllFoodViewModel: ObservableObject {
    @Published var meals: [Meal]
    @Published var title: String
    
    init(meals: [Meal], title: String) {
        self.meals = meals
        self.title = title
    }
}
