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
    
    init(titleNationCategoryMeal: [String], imageNationCategoryMeal: [String]) {
        self.titleNationCategoryMeal = titleNationCategoryMeal
        self.imageNationCategoryMeal = imageNationCategoryMeal
    }
}
