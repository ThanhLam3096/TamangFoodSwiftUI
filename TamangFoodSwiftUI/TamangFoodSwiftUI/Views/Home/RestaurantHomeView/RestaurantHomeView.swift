//
//  RestaurantHomeView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 18/6/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct RestaurantHomeView: View {
    let screenSize: ScreenSize
    @ObservedObject var viewModel: RestaurantHomeViewModel
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.clear)
            .frame(maxWidth: .infinity)
            .frame(height: screenSize.scaleHeight(292))
            .overlay(
                VStack {
                    Button(action: {
                        print("Go To Detail Food")
                    }, label: {
                        WebImage(url: URL(string: viewModel.restaurant.image))
                            .resizable()
                            .indicator(.activity)
                            .transition(.fade(duration: 0.5))
                            .scaledToFill()
                            .frame(height: screenSize.scaleHeight(185))
                            .cornerRadius(4)
                            .clipped()
                            .background {
                                if #available(iOS 15.0, *) {
                                    Color.gray.opacity(0.3)
                                } else {
                                    EmptyView()
                                }
                            }
                    })
                    CSpace(height: screenSize.scaleHeight(15))
                    Text(viewModel.restaurant.name)
                        .font(.yuGothicLight(size: screenSize.scaleHeight(20)))
                        .foregroundColor(.mainColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CSpace(height: screenSize.scaleHeight(10))
                    HStack {
                        Text("\(Int(viewModel.restaurant.averagePrice))$")
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundColor(.bodyTextColor)
                        CSpace(width: screenSize.scaleWidth(10))
                        Circle()
                            .fill(Color.bodyTextColor)
                            .frame(width: 5, height: 5)
                        CSpace(width: screenSize.scaleWidth(10))
                        Text(viewModel.restaurant.branch1)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundColor(.bodyTextColor)
                        CSpace(width: screenSize.scaleWidth(10))
                        Circle()
                            .fill(Color.bodyTextColor)
                            .frame(width: 5, height: 5)
                        CSpace(width: screenSize.scaleWidth(10))
                        Text(viewModel.restaurant.branch2)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundColor(.bodyTextColor)
                        CSpace(width: screenSize.scaleWidth(10))
                        Circle()
                            .fill(Color.bodyTextColor)
                            .frame(width: 5, height: 5)
                        CSpace(width: screenSize.scaleWidth(10))
                        Text(viewModel.restaurant.typeFood)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundColor(.bodyTextColor)
                        CSpace(width: screenSize.scaleWidth(10))
                        Spacer()
                    }
                    CSpace(height: screenSize.scaleHeight(10))
                    HStack {
                        Text(viewModel.restaurant.rating)
                            .font(.yuGothicLight(size: screenSize.scaleHeight(12)))
                            .foregroundColor(.mainColor)
                        CSpace(width: screenSize.scaleWidth(12))
                        Image(AppFood.StringImage.starIcon)
                            .frame(width: 14, height: 10)
                        CSpace(width: screenSize.scaleWidth(10))
                        Text(viewModel.restaurant.numberRating)
                            .font(.yuGothicLight(size: screenSize.scaleHeight(12)))
                            .foregroundColor(.mainColor)
                        CSpace(width: screenSize.scaleWidth(15))
                        Image(AppFood.StringImage.timberIcon)
                            .frame(width: 18, height: 16)
                        CSpace(width: screenSize.scaleWidth(10))
                        Text(viewModel.restaurant.time)
                            .font(.yuGothicLight(size: screenSize.scaleHeight(12)))
                            .foregroundColor(.mainColor)
                        CSpace(width: screenSize.scaleWidth(10))
                        Circle()
                            .fill(Color.bodyTextColor)
                            .frame(width: 5, height: 5)
                        CSpace(width: screenSize.scaleWidth(10))
                        Image(AppFood.StringImage.dollarIcon)
                            .frame(width: 18, height: 16)
                        CSpace(width: screenSize.scaleWidth(10))
                        Text(viewModel.restaurant.feeDelivery)
                            .font(.yuGothicLight(size: screenSize.scaleHeight(14)))
                            .foregroundColor(.mainColor)
                        CSpace(width: screenSize.scaleWidth(10))
                        Spacer()
                    }
                }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 0)
                    .padding(.horizontal, screenSize.scaleWidth(20))
            )
    }
}

#Preview {
    RestaurantHomeView(screenSize: ScreenSize(width: 375, height: 812), viewModel: RestaurantHomeViewModel(restaurant: Restaurant(image: "https://i0.wp.com/www.tusktravel.com/blog/wp-content/uploads/2023/07/Noma-Copenhagen-Denmark.jpg?w=1136&ssl=1", name: "Noma, Copenhagen, Denmark", branch1: "Chinese", branch2: "American", typeFood: "Deshi Food", rating: "4.3", numberRating: "200+ Ratings", time: "10 Min", feeDelivery: "Free", averagePrice: 42, id: 1)))
}
