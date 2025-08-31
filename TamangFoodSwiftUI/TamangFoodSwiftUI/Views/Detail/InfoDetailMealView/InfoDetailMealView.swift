//
//  InfoDetailMealView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/8/25.
//

import SwiftUI

struct InfoDetailMealView: View {
    let screenSize: ScreenSize
    @ObservedObject var viewModel: InfoDetailMealViewModel
    
    var body: some View {
        Text(viewModel.meal.name)
            .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
            .foregroundStyle(Color.blackColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, screenSize.scaleWidth(20))
        CSpace(height: screenSize.scaleHeight(10))
        HStack {
            Text( "\(displayNumber(viewModel.meal.price))$")
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                .foregroundStyle(Color.bodyTextColor)
            CSpace(width: screenSize.scaleWidth(10))
            Circle()
                .fill(Color.bodyTextColor)
                .frame(width: 5, height: 5)
            CSpace(width: screenSize.scaleWidth(10))
            Text(viewModel.meal.nation1)
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                .foregroundStyle(Color.bodyTextColor)
            CSpace(width: screenSize.scaleWidth(15))
            Circle()
                .fill(Color.bodyTextColor)
                .frame(width: 5, height: 5)
            CSpace(width: screenSize.scaleWidth(10))
            Text(viewModel.meal.nation2)
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                .foregroundStyle(Color.bodyTextColor)
            CSpace(width: screenSize.scaleWidth(15))
            Circle()
                .fill(Color.bodyTextColor)
                .frame(width: 5, height: 5)
            CSpace(width: screenSize.scaleWidth(10))
            Text(viewModel.meal.typeFood)
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                .foregroundStyle(Color.bodyTextColor)
            Spacer()
        }
        .padding(.horizontal, screenSize.scaleWidth(20))
        CSpace(height: screenSize.scaleHeight(10))
        HStack {
            Text(viewModel.meal.rating)
                .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                .foregroundStyle(Color.mainColor)
            CSpace(width: screenSize.scaleWidth(10))
            Image("Star")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: screenSize.scaleWidth(12))
            CSpace(width: screenSize.scaleWidth(10))
            Text("\(viewModel.meal.totalVote)+ Ratings")
                .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                .foregroundStyle(Color.mainColor)
            Spacer()
        }
        .padding(.horizontal, screenSize.scaleWidth(20))
        CSpace(height: screenSize.scaleHeight(25))
        HStack(alignment: .top) {
            HStack(alignment: .bottom) {
                Image("active")
                    .resizable()
                    .frame(width: screenSize.scaleWidth(18), height: screenSize.scaleHeight(24))
                Image("dollar")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: screenSize.scaleWidth(17))
                    .padding(.leading, -20)
            }
            CSpace(width: screenSize.scaleWidth(10))
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.meal.feeShip == 0 ? "Free" : "\(displayNumber(viewModel.meal.feeShip))")
                    .font(.yuGothicUILight(size: screenSize.scaleHeight(16)))
                    .foregroundStyle(Color.mainColor)
                Text(viewModel.meal.feeShip == 0 ? "Delivery" : "Dollars")
                    .font(.yuGothicUIRegular(size: screenSize.scaleHeight(12)))
                    .foregroundStyle(Color.mainColor)
            }
            CSpace(width: screenSize.scaleWidth(30))
            HStack(alignment: .bottom) {
                Image("active")
                    .resizable()
                    .frame(width: screenSize.scaleWidth(18), height: screenSize.scaleHeight(24))
                Image("timer")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: screenSize.scaleWidth(17))
                    .padding(.leading, -20)
            }
            CSpace(width: screenSize.scaleWidth(10))
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.meal.time.replacingOccurrences(of: "min", with: ""))
                    .font(.yuGothicUILight(size: screenSize.scaleHeight(16)))
                    .foregroundStyle(Color.mainColor)
                Text("Minutes")
                    .font(.yuGothicUIRegular(size: screenSize.scaleHeight(12)))
                    .foregroundStyle(Color.mainColor)
            }
            Spacer()
            Button(action: {
                print("Share")
            }, label: {
                Text("TAKE AWAY")
            })
            .frame(width: screenSize.scaleWidth(113), height: screenSize.scaleHeight(40))
            .buttonStyle(OutlineActiveButtonStyle(activeColor: .activeColor))
        }
        .padding(.horizontal, screenSize.scaleWidth(20))
    }
}

#Preview {
    InfoDetailMealView(screenSize: ScreenSize(width: 375, height: 812), viewModel: InfoDetailMealViewModel(meal: Meal(image: "https://www.holidify.com/images/cmsuploads/compressed/c700x420_20181227132950.jpg", name: "Sushi", typeFood: "Sea Food", price: 5, address: "Tokyo, Japan", nation1: "Japan", nation2: "Japan", time: "10min", rating: "5.0", totalVote: 1123, fee: 1, idMeal: 0)))
}
