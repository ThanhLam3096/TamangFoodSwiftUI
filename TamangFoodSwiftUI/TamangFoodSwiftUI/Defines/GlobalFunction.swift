//
//  GlobalFunction.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 17/6/25.
//

import Foundation

func displayNumber(_ number: Double) -> String {
    if number.truncatingRemainder(dividingBy: 1) != 0 {
        return String(number)
    } else {
        return String(Int(number))
    }
}
