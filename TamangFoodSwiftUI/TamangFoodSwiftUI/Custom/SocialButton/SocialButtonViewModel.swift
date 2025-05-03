//
//  SocialButtonViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 3/5/25.
//

import Foundation

final class SocialButtonViewModel: ObservableObject {
    // MARK: - Properties
    var socialType: SocialAccountType

    init(socialType: SocialAccountType) {
        self.socialType = socialType
    }
}
