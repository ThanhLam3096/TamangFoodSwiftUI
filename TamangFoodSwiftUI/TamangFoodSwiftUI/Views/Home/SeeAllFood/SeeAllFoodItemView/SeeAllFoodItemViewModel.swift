//
//  SeeAllFoodItemViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 21/6/25.
//

import Foundation

final class SeeAllFoodItemViewModel: ObservableObject {
    @Published var meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
}
