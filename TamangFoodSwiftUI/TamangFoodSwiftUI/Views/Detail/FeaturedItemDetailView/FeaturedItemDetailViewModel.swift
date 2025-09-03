//
//  FeaturedItemDetailViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/8/25.
//

import Foundation

final class FeaturedItemDetailViewModel: ObservableObject {
    
    // MARK: Propertiers
    @Published var meal: Meal
    
    // MARK: init
    init(meal: Meal) {
        self.meal = meal
    }
}
