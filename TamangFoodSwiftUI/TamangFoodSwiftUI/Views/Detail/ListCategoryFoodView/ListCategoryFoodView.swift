//
//  ListCategoryFoodView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 19/8/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListCategoryFoodView: View {
    
    let screenSize: ScreenSize
    @ObservedObject var viewModel: ListCategoryFoodViewModel
    
    var body: some View {
        VStack {
            CSpace(height: screenSize.scaleHeight(20))
            HStack(alignment: .top) {
                WebImage(url: URL(string: viewModel.mealDB.imageMeal))
                    .resizable()
                    .frame(width: screenSize.scaleWidth(110), height: screenSize.scaleWidth(110))
                    .cornerRadius(6, corners: .allCorners)
                CSpace(width: screenSize.scaleWidth(20))
                VStack(alignment: .leading) {
                    Text(viewModel.mealDB.nameMeal)
                        .font(.yuGothicLight(size: screenSize.scaleHeight(18)))
                        .foregroundStyle(Color.mainColor)
                        .frame(maxHeight: .infinity, alignment: .top)
                    Text("Something Info Meal At Here =)")
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                        .foregroundStyle(Color.mainColor)
                        .frame(maxHeight: .infinity, alignment: .center)
                    Text("Cookie Sandwich")
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(14)))
                        .foregroundStyle(Color.mainColor)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .frame(maxWidth: .infinity)
                .frame(height: screenSize.scaleWidth(110))
            }
            .padding(.horizontal, screenSize.scaleWidth(20))
            CSpace(height: screenSize.scaleHeight(20))
            Color(hex: "#F6F6F6")
                .frame(height: 1)
                .padding(.horizontal, screenSize.scaleWidth(20))
        }
    }
}

//#Preview {
//    ListCategoryFoodView(screenSize: ScreenSize(width: 375, height: 812), viewModel: ListCategoryFoodViewModel(mealDB: The))
//}
