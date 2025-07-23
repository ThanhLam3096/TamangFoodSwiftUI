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
    
    func goToSeeAll(meals: [Meal], title: String) {
        path.append(Router.seeAll(meals: meals, title: title))
    }

    func goBack() {
        path.removeLast(path.count)
    }
    
    func goToRoot() {
        path.removeLast(path.count)
    }
}
//@Observable
//class NavigationRouter {
//    var path = NavigationPath()
//    func navigateToCreateAccount() {
//        path.append(Route.createAccount)
//    }
//    func navigateToHome() {
//        path.append(Route.home)
//    }
//    func navigateToSeeAll() {
//        path.append(Route.seeAll)
//    }
//    func popToRoot() {
//        path.removeLast(path.count)
//    }
//}

enum Router: Hashable {
    case seeAll( meals: [Meal], title: String)
}
