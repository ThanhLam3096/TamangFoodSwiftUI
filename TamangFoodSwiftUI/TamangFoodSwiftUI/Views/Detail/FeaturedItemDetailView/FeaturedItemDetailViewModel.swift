//
//  FeaturedItemDetailViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/8/25.
//

import Foundation

final class FeaturedItemDetailViewModel: ObservableObject {
    @Published var meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
}
