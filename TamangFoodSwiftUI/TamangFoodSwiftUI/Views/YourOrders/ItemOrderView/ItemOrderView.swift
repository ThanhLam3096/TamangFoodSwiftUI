//
//  ItemOrderView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 5/9/25.
//

import SwiftUI

struct ItemOrderView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ItemOrderViewModel
    let screenSize: ScreenSize
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("\(viewModel.indexID)")
                    .frame(width: screenSize.scaleWidth(24) ,height: screenSize.scaleWidth(24))
                    .foregroundStyle(Color.myAccentColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: screenSize.scaleHeight(4))
                            .stroke(Color.bodyTextColor, lineWidth: 1))
                CSpace(width: screenSize.scaleWidth(16))
                VStack(alignment: .leading) {
                    Text(viewModel.order.meal.name)
                        .font(.yuGothicUILight(size: screenSize.scaleHeight(18)))
                        .foregroundStyle(Color.mainColor)
                    CSpace(height: screenSize.scaleHeight(6))
                    Text("No Salt, no sugar, more caffein")
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                        .foregroundStyle(Color.mainColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                Text("Dollars$\(viewModel.summaryPriceMeal())")
                    .font(.yuGothicUISemibold(size: screenSize.scaleHeight(14)))
                    .foregroundStyle(Color.myAccentColor)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .frame(maxWidth: .infinity, alignment: .top)
            CSpace(height: screenSize.scaleHeight(20))
            Color(hex: "#F6F6F6")
                .frame(height: 1)
            CSpace(height: screenSize.scaleHeight(20))
        }
    }
}

#Preview {
    ItemOrderView(viewModel: ItemOrderViewModel(order: OrderMeal(meal: sushiMeal, topCustom: "Need More Fish", bottomCustom: "Need More Fish", quantity: 18, email: "haha@gmail.com"), indexID: 1), screenSize: ScreenSize(width: 375, height: 812))
}
