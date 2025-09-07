//
//  AuthNavigationRouter.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 6/9/25.
//

import Foundation
import SwiftUI
import Observation

class AuthNavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    // Modal (present)
    @Published var presentedSheet: AuthRouter? = nil
    @Published var presentedFullScreen: AuthRouter? = nil
    
    // MARK: - Push
    func push(_ route: AuthRouter) {
        path.append(route)
    }
    
    func goBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func goToRoot() {
        path.removeLast(path.count)
    }
    
    // MARK: - Present
    func presentSheet(_ route: AuthRouter) {
        presentedSheet = route
    }
    
    func presentFullScreen(_ route: AuthRouter) {
        presentedFullScreen = route
    }
    
    func dismissSheet() {
        presentedSheet = nil
    }
    
    func dismissFullScreen() {
        presentedFullScreen = nil
    }
}

enum AuthRouter: Hashable, Identifiable {
    case pageNumber
    case signIn
    case home
    case createAccount
    case forgotPassword
    case definePhoneNumber
    case verifyPhoneNumber
    
    var id: String {
        switch self {
        case .pageNumber:
            return "pageNumber"
        case .signIn:
            return "signIn"
        case .home:
            return "home"
        case .createAccount:
            return "createAccount"
        case .forgotPassword:
            return "forgotPassword"
        case .definePhoneNumber:
            return "definePhoneNumber"
        case .verifyPhoneNumber:
            return "verifyPhoneNumber"
        }
    }
}
