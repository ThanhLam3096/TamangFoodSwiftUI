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
    @Published var selectedMeal: Meal? = nil
    
    func goToSeeAll(meals: [Meal], title: String) {
        path.append(Router.seeAll(meals: meals, title: title))
    }
    
    func goToDetail(meal: Meal) {
        showDetail = true
        path.append(Router.detail(meal: meal))
    }
    
    func showDetailFullScreen(meal: Meal) {
        selectedMeal = meal
    }
    
    func closeDetail() {
        showDetail = false
    }

    func goBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func goToRoot() {
        path.removeLast(path.count)
    }
}

enum Router: Hashable {
    case seeAll(meals: [Meal], title: String)
    case detail(meal: Meal)
}
