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
    @Published var showDetail: Bool = false
    
    func goToSeeAll(meals: [Meal], title: String) {
        path.append(Router.seeAll(meals: meals, title: title))
    }
    
//    func goToDetail() {
//        path.append(Router.detail)
//    }
    func goToDetail() {
        showDetail = true
    }
    
    func closeDetail() {
        showDetail = false
    }

    func goBack() {
        path.removeLast(path.count)
    }
    
    func goToRoot() {
        path.removeLast(path.count)
    }
}

enum Router: Hashable {
    case seeAll( meals: [Meal], title: String)
    case detail
}
