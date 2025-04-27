//
//  ScreenSize.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 8/4/25.
//

import Foundation
import SwiftUI

struct ScreenSize {
    var width: CGFloat
    var height: CGFloat

    func scaleWidth(_ value: CGFloat) -> CGFloat {
        value * (width / 375)
    }
    
    func scaleHeight(_ value: CGFloat) -> CGFloat {
        value * (height / 812)
    }
}
