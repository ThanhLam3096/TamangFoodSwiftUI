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
}
