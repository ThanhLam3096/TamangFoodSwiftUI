//
//  HeaderSpiceViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 2/9/25.
//

import Foundation

final class HeaderSpiceViewModel: ObservableObject {
    
    // MARK: Propertiers
    @Published var titleHeader: String
    @Published var data: String
    
    init(titleHeader: String, data: String) {
        self.titleHeader = titleHeader
        self.data = data
    }
}
