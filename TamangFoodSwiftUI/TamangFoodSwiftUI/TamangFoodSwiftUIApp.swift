//
//  TamangFoodSwiftUIApp.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 8/4/25.
//

import SwiftUI

@main
struct TamangFoodSwiftUIApp: App {
    @StateObject private var router = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                TabbarView()
                    .navigationDestination(for: Router.self) { route in
                        switch route {
                        case .seeAll(let meals, let title):
                            SeeAllFoodView(viewModel: SeeAllFoodViewModel(meals: meals, title: title))
                        }
                    }
                
            }
            .environmentObject(router)
        }
    }
}


