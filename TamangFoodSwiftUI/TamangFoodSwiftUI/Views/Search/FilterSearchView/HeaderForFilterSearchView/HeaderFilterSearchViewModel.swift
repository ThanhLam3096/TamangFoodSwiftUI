//
//  HeaderFilterSearchViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 17/9/25.
//

import Foundation

final class HeaderFilterSearchViewModel: ObservableObject {
    @Published var headerType: HeaderFilterType
    
    init(headerType: HeaderFilterType) {
        self.headerType = headerType
    }
}
