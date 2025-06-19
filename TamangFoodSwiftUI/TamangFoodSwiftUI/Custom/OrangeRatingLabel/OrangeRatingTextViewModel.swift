//
//  OrangeRatingTextViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 17/6/25.
//

import Foundation

final class OrangeRatingTextViewModel: ObservableObject {
    @Published var rating: String
    
    init(rating: String) {
           self.rating = rating
       }
}
