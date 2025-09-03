//
//  ChoiceSpiceViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 31/8/25.
//

import Foundation

final class ChoiceSpiceViewModel: ObservableObject {
    
    // MARK: Propertiers
    @Published var spice: String
    @Published var isSelectedSpice: Bool = false
    
    init(spice: String, isSelectedSpice: Bool) {
        self.spice = spice
        self.isSelectedSpice = isSelectedSpice
    }

}
