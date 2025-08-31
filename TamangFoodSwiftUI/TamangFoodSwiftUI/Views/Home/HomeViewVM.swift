//
//  HomeViewVM.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 22/5/25.
//

import Foundation

final class HomeViewVM: ObservableObject {
    @Published var listLocation: [String] = [
            "Ha Noi, Viet Nam",
            "New York, USA",
            "Paris, France",
            "London, England",
            "Bac Kinh, China",
            "Tokyo, Japan",
            "Malina, India",
            "Kevin, Australia",
            "Moscow, Russia",
            "Munich ,Germany",
            "Madrid, Spanish",
            "Buenos Aires, Argentina",
            "Brasília, Brazil"
        ]
    @Published var listSliderFoodImage: [String] = ["food1", "food2", "food3", "food4", "food5"]
    @Published var featurePartnesMealDummyData: [Meal] = dummyMealFeaturePartnes.featurePartnesMeal
    
    @Published var listMealFeaturePartners: [Meal] = []
    @Published var listNationFood: [Meal] = []
    @Published var listRestaurants: [Restaurant] = []
    
    @Published var moveToSeeAllFood = false
    
    func moveToScreenSeeAll() {
        moveToSeeAllFood = true
    }
    
    
    func getAPIListFeaturePartners(listFeaturePartnersCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getFeaturePartners { [weak self] (mealResult) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                switch mealResult {
                case .failure(let error):
                    listFeaturePartnersCompletion(false, error)
                case .success(let result):
                    this.listMealFeaturePartners = result.featurePartnes
                    listFeaturePartnersCompletion(true, AppFood.String.loadSuccess)
                }
            }
        }
    }
    
    func getAPIListNationFood(listNationFoodCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getFoodNation { [weak self] (mealResult) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                switch mealResult {
                case .failure(let error):
                    listNationFoodCompletion(false, error)
                case .success(let result):
                    this.listNationFood = result.meals
                    listNationFoodCompletion(true, AppFood.String.loadSuccess)
                }
            }
        }
    }
    
    func getAPIListRestaurant(listRestaurantCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getListRestaurant { [weak self] (restaurantResult) in
            guard let this = self else { return }
            switch restaurantResult {
            case .failure(let error):
                listRestaurantCompletion(false, error)
            case .success(let result):
                for item in result.restaurants {
                    this.listRestaurants.append(item)
                }
                listRestaurantCompletion(true, AppFood.String.loadSuccess)
            }
        }
    }
}
