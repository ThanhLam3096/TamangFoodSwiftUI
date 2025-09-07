//
//  Restaurant.swift
//  FoodSwift
//
//  Created by Thanh Lâm on 14/10/24.
//

import Foundation

final class Restaurant: Codable {
    let image: String
    let name: String
    let branch1: String
    let branch2: String
    let typeFood: String
    let rating: String
    let numberRating: String
    let time: String
    let feeDelivery: String
    let averagePrice: Double
    let id: Int
    
    init(image: String, name: String, branch1: String, branch2: String, typeFood: String, rating: String, numberRating: String, time: String, feeDelivery: String, averagePrice: Double, id: Int) {
        self.image = image
        self.name = name
        self.branch1 = branch1
        self.branch2 = branch2
        self.typeFood = typeFood
        self.rating = rating
        self.numberRating = numberRating
        self.time = time
        self.feeDelivery = feeDelivery
        self.averagePrice = averagePrice
        self.id = id
    }
}
