//
//  NumberDouble.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 28/8/25.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
