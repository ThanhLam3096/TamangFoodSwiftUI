//
//  View.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 3/5/25.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
