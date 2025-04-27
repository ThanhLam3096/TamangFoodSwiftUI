//
//  Spacer.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 11/4/25.
//

import SwiftUI

struct CSpace: View {
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var color: Color = .clear

    var body: some View {
        Color(color)
            .frame(width: width, height: height)
    }
}
