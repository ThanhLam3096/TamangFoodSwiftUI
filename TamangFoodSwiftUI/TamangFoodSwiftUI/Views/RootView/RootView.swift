//
//  RootView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 7/9/25.
//

import SwiftUI

struct RootView: View {
    // MARK: - Properties
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @StateObject var authRouter = AuthNavigationRouter()
    @StateObject var mainRouter = MainNavigationRouter()
    
    var body: some View {
        if isLoggedIn {
            // Main App Flow
            TabbarView()
                .environmentObject(mainRouter)
        } else {
            // Auth App Flow
            NavigationStack(path: $authRouter.path) {
                Welcome()
                    .navigationDestination(for: AuthRouter.self) { route in
                        switch route {
                        case .pageNumber:
                            PageNumber()
                        case .signIn:
                            SignIn()
                        case .home:
                            HomeView()
                        case .createAccount:
                            CreateAccountView()
                        case .forgotPassword:
                            ForgotPassword()
                        case .definePhoneNumber:
                            DefinePhoneNumberView()
                        case .verifyPhoneNumber:
                            VerifyPhoneNumberView()
                        }
                    }
            }
            .environmentObject(authRouter)
        }
    }
}

#Preview {
    RootView()
}
