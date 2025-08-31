//
//  ListCategoryFoodViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 19/8/25.
//

import Foundation

final class ListCategoryFoodViewModel: ObservableObject {
    @Published var mealDB: TheMealDB
    
    init(mealDB: TheMealDB) {
        self.mealDB = mealDB
    }
    
    func randomDecimal() -> Double {
        return Double.random(in: 1.0...10.0).rounded(toPlaces: 1)
    }
}
