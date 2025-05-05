//
//  PageNumberViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 4/5/25.
//

import Foundation
import SwiftUI

final class PageNumberViewModel: ObservableObject {
    @Published var page = 0
    @Published var imageIntroduce = AppText.imagePageOne
    @Published var titleIntroduce = AppText.titlePageOne
    @Published var descriptionIntroduce = AppText.onboardingPageOneDescription
    @Published var navigateToSignIn = false

    func nextPage() {
        switch page {
        case 0:
            page += 1
            imageIntroduce = AppText.imagePageTwo
            titleIntroduce = AppText.titlePageTwo
            descriptionIntroduce = AppText.onboardingPageTwoDescription
        case 1:
            page += 1
            imageIntroduce = AppText.imagePageThree
            titleIntroduce = AppText.titlePageThree
            descriptionIntroduce = AppText.onboardingPageThreeDescription
        default:
            navigateToSignIn = true
        }
    }
}
