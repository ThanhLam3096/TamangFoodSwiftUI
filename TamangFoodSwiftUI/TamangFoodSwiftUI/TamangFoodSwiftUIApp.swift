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
            TabbarView()
                .environmentObject(router)
        }
    }
}
