//
//  SearchViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 9/9/25.
//

import Foundation

final class SearchViewModel: ObservableObject {
    let flagsNationMeal = ["USA", "British", "Canadian", "China", "Croatian", "Dutch", "Egyptian", "Filipino", "France", "Greek", "Indian", "Irish", "Italian", "Jamaican", "Japan", "Kenyan", "Malaysian", "Mexican", "Moroccan", "Polish", "Portuguese", "Russia", "Spanish", "Thai", "Tunisian", "Turkish", "Ukrainian", "Unknown", "VietNam"]
    let dishTypeMeal = ["Beef", "Breakfast", "Chicken", "Dessert", "Goat", "Lamb", "Miscellaneous", "Pasta", "Pork", "Seafood", "Side", "Starter", "Vegan", "Vegetarian"]
    @Published var isNation = true
    @Published var isSearchKey = true
    
    
}
