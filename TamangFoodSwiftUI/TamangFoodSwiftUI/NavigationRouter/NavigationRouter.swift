//
//  NavigationRouter.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 20/6/25.
//

import Foundation
import SwiftUI
import Observation

class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    // Modal (present)
    @Published var presentedSheet: Router? = nil
    @Published var presentedFullScreen: Router? = nil
    
    // MARK: - Push
    func push(_ route: Router) {
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
    func presentSheet(_ route: Router) {
        presentedSheet = route
    }
    
    func presentFullScreen(_ route: Router) {
        presentedFullScreen = route
    }
    
    func dismissSheet() {
        presentedSheet = nil
    }
    
    func dismissFullScreen() {
        presentedFullScreen = nil
    }
}

enum Router: Hashable, Identifiable {
    case seeAll(meals: [Meal], title: String)
    case detail(meal: Meal)
    case addToOrder(meal: Meal)
    case yourOrder
    
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
        }
    }
}
