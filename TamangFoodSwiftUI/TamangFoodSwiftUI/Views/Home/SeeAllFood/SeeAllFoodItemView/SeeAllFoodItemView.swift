//
//  SeeAllFoodItemView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 19/6/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SeeAllFoodItemView: View {
    
    let screenSize: ScreenSize
    @ObservedObject var viewModel: SeeAllFoodItemViewModel
    let action: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.clear)
            .frame(width: screenSize.scaleWidth(160), height: screenSize.scaleHeight(348))
            .overlay(
                VStack {
                    ZStack(alignment: .bottomLeading) {
                        Button(action: {
                            action()
                        }, label: {
                            ZStack {
                                WebImage(url: URL(string: viewModel.meal.image))
                                    .resizable()
                                    .indicator(.activity)
                                    .transition(.fade(duration: 0.5))
                                    .scaledToFill()
                                    .frame(width: screenSize.scaleWidth(160) ,height: screenSize.scaleHeight(280))
                                    .cornerRadius(4)
                                    .clipped()
                                    .background {
                                        if #available(iOS 15.0, *) {
                                            Color.gray.opacity(0.3)
                                        } else {
                                            EmptyView()
                                        }
                                    }
                                VStack {
                                    Spacer()
                                    HStack {
                                        Image("fast-clock")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: screenSize.scaleWidth(13), height: screenSize.scaleWidth(13))
                                        CSpace(width: screenSize.scaleWidth(5))
                                        Text(viewModel.meal.time)
                                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(12)))
                                            .foregroundStyle(Color.bgColor)
                                        Spacer()
                                    }
                                    .padding(.leading, screenSize.scaleWidth(10))
                                    CSpace(height: screenSize.scaleHeight(10))
                                    HStack {
                                        Image("fee_ship")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: screenSize.scaleWidth(13), height: screenSize.scaleWidth(13))
                                        CSpace(width: screenSize.scaleWidth(5))
                                        feeShipText(screenSize: screenSize)
                                        Spacer()
                                        OrangeRatingText(screenSize: screenSize, viewModel: OrangeRatingTextViewModel(rating: viewModel.meal.rating))
                                    }
                                    .padding(.horizontal, screenSize.scaleWidth(10))
                                    CSpace(height: screenSize.scaleHeight(10))
                                }
                                    .frame(width: screenSize.scaleWidth(160), height: screenSize.scaleHeight(280))
                            }
                        })
                    }
                    CSpace(height: screenSize.scaleHeight(10))
                    Text(viewModel.meal.name)
                        .font(.yuGothicLight(size: screenSize.scaleHeight(20)))
                        .foregroundStyle(Color.mainColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CSpace(height: screenSize.scaleHeight(5))
                    HStack(alignment: .center) {
                        Text(viewModel.meal.nation1)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundStyle(Color.bodyTextColor)
                        CSpace(width: screenSize.scaleWidth(5))
                        Circle()
                            .fill(Color.bodyTextColor)
                            .frame(width: 5, height: 5)
                        CSpace(width: screenSize.scaleWidth(5))
                        Text(viewModel.meal.nation2)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundStyle(Color.bodyTextColor)
                        Spacer()
                    }
                }
            )
    }
    
    @ViewBuilder
    private func feeShipText(screenSize: ScreenSize) -> some View {
        if viewModel.meal.feeShip == 0 {
            Text("Free")
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(12)))
                .foregroundStyle(Color.bgColor)
        } else {
            Text("\(displayNumber(viewModel.meal.feeShip))$")
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(12)))
                .foregroundStyle(Color.bgColor)
        }
    }
}

#Preview {
    SeeAllFoodItemView(screenSize: ScreenSize(width: 375, height: 812), viewModel: SeeAllFoodItemViewModel(meal: Meal(image: "https://www.holidify.com/images/cmsuploads/compressed/8896564-16x9-large_20181227133052.jpg", name: "Rendang", typeFood: "Beef", price: 12, address: "Jakarta, Indonesia", nation1: "Indonesia", nation2: "Malaysia", time: "14min", rating: "4.4", totalVote: 1123, fee: 0.6, idMeal: 1)), action: {})
}
