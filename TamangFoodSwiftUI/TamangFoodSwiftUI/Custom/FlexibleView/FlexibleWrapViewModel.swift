//
//  FlexibleWrapViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 20/9/25.
//

import Foundation

final class FlexibleWrapViewModel: ObservableObject {
    
    // MARK: - Properties
    var tags: [String]
    var horizontalSpacing: CGFloat = 8
    var verticalSpacing: CGFloat = 8
    var paddingText: CGFloat = 0
    var listFilterChoice: [String] = []
    
    init(tags: [String], horizontalSpacing: CGFloat, verticalSpacing: CGFloat, paddingText: CGFloat, listFilterChoice: [String]) {
        self.tags = tags
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.paddingText = paddingText
        self.listFilterChoice = listFilterChoice
    }
}
