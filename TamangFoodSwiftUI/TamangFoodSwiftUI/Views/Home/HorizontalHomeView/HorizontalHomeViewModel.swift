//
//  HorizontalHomeViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 17/6/25.
//

import Foundation

final class HorizontalHomeViewModel: ObservableObject {
    @Published var meal: Meal
    @Published var typeList: TypeList
    
    init(meal: Meal, typeList: TypeList) {
        self.meal = meal
        self.typeList = typeList
    }
}
