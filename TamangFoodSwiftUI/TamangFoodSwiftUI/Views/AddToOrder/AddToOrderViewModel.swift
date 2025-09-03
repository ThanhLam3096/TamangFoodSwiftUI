//
//  AddToOrderViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 31/8/25.
//

import Foundation

final class AddToOrderViewModel: ObservableObject {
    // MARK: Propertiers
    @Published var meal: Meal
    var listChoice = [
        "Chocolate Chip",
        "Cookies and Cream",
        "Funfetti",
        "M and M",
        "Red Velvet",
        "Peanut Butter",
        "Snickerdoodle",
        "White Chocolate Macadamia"
    ]
    @Published var customSpiceTop: String = ""
    @Published var customSpiceBottom: String = ""
    @Published var numberOfMeals = 1
    
    var totalOfPriceMeal: Double {
        let totalPrice = meal.price * Double(numberOfMeals)
        return totalPrice.rounded(toPlaces: 1)
    }
    
    // MARK: init
    init(meal: Meal) {
        self.meal = meal
    }
    
    func updateNumberOfMeals(numberOfMeals: Int) -> String {
        return String(format: "%02d", numberOfMeals)
    }
    
    func minusAction() {
        if numberOfMeals > 1 {
            numberOfMeals = numberOfMeals - 1
        } else {
            numberOfMeals = 1
        }
    }
    
    func plusAction() {
        numberOfMeals = numberOfMeals + 1
    }
}
