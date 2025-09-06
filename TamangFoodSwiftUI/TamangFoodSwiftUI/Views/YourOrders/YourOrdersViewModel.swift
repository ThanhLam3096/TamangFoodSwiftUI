//
//  YourOrdersViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 5/9/25.
//

import Foundation

final class YourOrdersViewModel: ObservableObject {
    @Published var yourOrderTotalPrice: Double = 0
    @Published var totalPrice: Double = 0
    @Published var feeShip: Double = 0
    @Published var listOrderMeals: [OrderMeal] = []
    private(set) var email: String?
    
    var dummyOrderMeal: [OrderMeal] = DummyOrderData.dummyOrderData
}
