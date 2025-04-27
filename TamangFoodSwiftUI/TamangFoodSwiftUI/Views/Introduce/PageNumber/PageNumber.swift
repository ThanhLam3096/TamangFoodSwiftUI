//
//  PageNumber.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 25/4/25.
//

import SwiftUI

struct PageNumber: View {
    @State private var imageIntroduce = AppText.imagePageOne
    @State private var titleIntroduce = AppText.titlePageOne
    @State private var descriptionIntroduce = AppText.onboardingPageOneDescription
    @State private var page = 0
    var body: some View {
        IntroducePage(
            imageIntroduce: imageIntroduce,
            titleIntroduce: titleIntroduce,
            descriptionIntroduce: descriptionIntroduce,
            page: page,
            onTapButton: {
                if page == 0 {
                    page = page + 1
                    imageIntroduce = AppText.imagePageTwo
                    titleIntroduce = AppText.titlePageTwo
                    descriptionIntroduce = AppText.onboardingPageTwoDescription
                } else if page == 1 {
                    page = page + 1
                    imageIntroduce = AppText.imagePageThree
                    titleIntroduce = AppText.titlePageThree
                    descriptionIntroduce = AppText.onboardingPageThreeDescription
                } else {
                    print("Move New Screen")
                }
            }
        )
        .navigationBarHidden(true)
    }
}

#Preview {
    PageNumber()
}
