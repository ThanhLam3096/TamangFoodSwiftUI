//
//  FilterSearchViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/9/25.
//

import Foundation
import SwiftUI

final class FilterSearchViewModel: ObservableObject {
    @Published var filterByNation: [String] = []
    @Published var filterByCategory: [String] = []
    let filterByPriceRange: [String] = ["$", "$$", "$$$", "$$$$", "$$$$$", "$$$$$$", "$$$$$$$"]
    @Published var choosingNation: [String] = []
    @Published var choosingCategories: [String] = []
    @Published var choosingPriceRange: [String] = []
    
    @AppStorageCodableFilterSearch("choosingNation", defaultValue: []) var storedFilterNation: [String]
    @AppStorageCodableFilterSearch("choosingCategories", defaultValue: []) var storedCategories: [String]
    @AppStorageCodableFilterSearch("choosingPrice", defaultValue: []) var storedPrice: [String]
    
    init(filterByNation: [String], filterByCategory: [String]) {
        self.filterByNation = filterByNation
        self.filterByCategory = filterByCategory
        choosingNation = storedFilterNation
        choosingCategories = storedCategories
        choosingPriceRange = storedPrice
    }
    
    func filterSearch(_ searchFilter: String, for type: HeaderFilterType) {
        switch type {
        case .nationHeader:
            if choosingNation.contains(searchFilter) {
                choosingNation.removeAll { $0 == searchFilter }
            } else {
                choosingNation.append(searchFilter)
            }
            storedFilterNation = choosingNation // ✅ sync in AppStorage
        case .categoryHeader:
            if choosingCategories.contains(searchFilter) {
                choosingCategories.removeAll { $0 == searchFilter }
            } else {
                choosingCategories.append(searchFilter)
            }
            storedCategories = choosingCategories // ✅ sync in AppStorage
        case .priceRangeHeader:
            if choosingPriceRange.contains(searchFilter) {
                choosingPriceRange.removeAll { $0 == searchFilter }
            } else {
                choosingPriceRange.append(searchFilter)
            }
            storedPrice = choosingPriceRange // ✅ sync in AppStorage
        }
    }
    
    func removeFilterSearch(for type: HeaderFilterType) {
        switch type {
        case .nationHeader:
            clear(&choosingNation, &storedFilterNation)
        case .categoryHeader:
            clear(&choosingCategories, &storedCategories)
        case .priceRangeHeader:
            clear(&choosingPriceRange, &storedPrice)
        }
    }

    private func clear(_ choosing: inout [String], _ stored: inout [String]) {
        choosing.removeAll()
        stored = choosing
    }
}
