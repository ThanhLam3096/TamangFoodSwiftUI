//
//  RestaurantHomeViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 18/6/25.
//

import Foundation

final class RestaurantHomeViewModel: ObservableObject {
    
    @Published var restaurant: Restaurant
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
