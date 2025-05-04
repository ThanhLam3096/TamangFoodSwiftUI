//
//  PageNumber.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 25/4/25.
//

import SwiftUI

struct PageNumber: View {
    @StateObject private var viewModel = PageNumberViewModel()
    @State private var path: [SignInRoute] = []

    var body: some View {
        IntroducePage(
            imageIntroduce: viewModel.imageIntroduce,
            titleIntroduce: viewModel.titleIntroduce,
            descriptionIntroduce: viewModel.descriptionIntroduce,
            page: viewModel.page,
            onTapButton: {
                viewModel.nextPage()
            }
        )
        .navigationDestination(isPresented: $viewModel.navigateToSignIn) {
            SignIn(path: $path)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    PageNumber()
}
