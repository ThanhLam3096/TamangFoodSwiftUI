//
//  FilterSearchViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/9/25.
//

import Foundation

final class FilterSearchViewModel: ObservableObject {
    @Published var filterByNation: [String] = []
    @Published var filterByCategory: [String] = []
    let filterByPriceRange: [String] = ["$", "$$", "$$$", "$$$$", "$$$$$", "$$$$$$", "$$$$$$$"]
    @Published var choosingNation: [String] = []
    @Published var choosingCategories: [String] = []
    @Published var choosingPriceRange: [String] = []
    
    init(filterByNation: [String], filterByCategory: [String]) {
        self.filterByNation = filterByNation
        self.filterByCategory = filterByCategory
    }
}
