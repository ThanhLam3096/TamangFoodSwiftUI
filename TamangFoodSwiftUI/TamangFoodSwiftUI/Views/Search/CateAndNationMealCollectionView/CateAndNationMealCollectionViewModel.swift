//
//  CateAndNationMealCollectionViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 9/9/25.
//

import Foundation

final class CateAndNationMealCollectionViewModel: ObservableObject {
    @Published var titleNationCategoryMeal: [String] = []
    @Published var imageNationCategoryMeal: [String] = []
    var typeMeal: TypeMeal
    
    init(titleNationCategoryMeal: [String], imageNationCategoryMeal: [String], typeMeal: TypeMeal) {
        self.titleNationCategoryMeal = titleNationCategoryMeal
        self.imageNationCategoryMeal = imageNationCategoryMeal
        self.typeMeal = typeMeal
    }
}
