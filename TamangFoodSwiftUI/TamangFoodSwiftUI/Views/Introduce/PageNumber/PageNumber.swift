//
//  PageNumber.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 25/4/25.
//

import SwiftUI

struct PageNumber: View {
    // MARK: - Properties
    @EnvironmentObject var router: AuthNavigationRouter
    @StateObject private var viewModel = PageNumberViewModel()
    
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
        .navigationBarHidden(true)
        .onAppear {
            // ✅ Inject callback
            viewModel.onFinish = {
                router.push(.signIn)
            }
        }
    }
}

#Preview {
    PageNumber()
}
