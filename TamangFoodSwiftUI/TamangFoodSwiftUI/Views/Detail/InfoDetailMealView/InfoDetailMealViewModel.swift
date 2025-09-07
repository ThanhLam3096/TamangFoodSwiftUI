//
//  InfoDetailMealViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 25/8/25.
//

import Foundation

final class InfoDetailMealViewModel: ObservableObject {
    // MARK: - Properties
    @Published var meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
}
