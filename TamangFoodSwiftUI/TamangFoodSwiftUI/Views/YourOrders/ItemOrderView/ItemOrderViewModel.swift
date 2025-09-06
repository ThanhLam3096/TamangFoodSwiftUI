//
//  ItemOrderViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 5/9/25.
//

import Foundation

final class ItemOrderViewModel: ObservableObject {
    let order: OrderMeal
    let indexID: Int
    
    init(order: OrderMeal, indexID: Int) {
        self.order = order
        self.indexID = indexID
    }
    
    func summaryPriceMeal() -> String {
        let total = order.quantity
        let price = order.meal.price
        return displayNumber((Double(total) * price).rounded(toPlaces: 1))
    }
}
