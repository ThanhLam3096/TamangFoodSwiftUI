//
//  MainNavigationRouter.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 20/6/25.
//

import Foundation
import SwiftUI
import Observation

class MainNavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    // Modal (present)
    @Published var presentedSheet: MainRouter? = nil
    @Published var presentedFullScreen: MainRouter? = nil
    
    // MARK: - Push
    func push(_ route: MainRouter) {
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
    func presentSheet(_ route: MainRouter) {
        presentedSheet = route
    }
    
    func presentFullScreen(_ route: MainRouter) {
        presentedFullScreen = route
    }
    
    func dismissSheet() {
        presentedSheet = nil
    }
    
    func dismissFullScreen() {
        presentedFullScreen = nil
    }
}

enum MainRouter: Hashable, Identifiable {
    case seeAll(meals: [Meal], title: String)
    case detail(meal: Meal)
    case addToOrder(meal: Meal)
    case yourOrder
    case paymentMethod
    
    var id: String {
        switch self {
        case .seeAll(_, let title):
            return "seeAll_\(title)"
        case .detail(let meal):
            return "detail_\(meal.idMeal)"
        case .addToOrder(let meal):
            return "addToOrder_\(meal.idMeal)"
        case .yourOrder:
            return "yourOrder"
        case .paymentMethod:
            return "paymentMethod"
        }
    }
}
