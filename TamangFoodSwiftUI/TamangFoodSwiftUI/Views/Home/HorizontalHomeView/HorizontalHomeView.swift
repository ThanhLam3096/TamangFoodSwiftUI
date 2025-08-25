//
//  HorizontalHomeView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 15/6/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct HorizontalHomeView: View {
    
    let screenSize: ScreenSize
    let action: () -> Void
    @ObservedObject var viewModel: HorizontalHomeViewModel
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.clear)
            .frame(width: screenSize.scaleWidth(200), height: screenSize.scaleHeight(254))
            .overlay(
                    Button(action: {
                        action()
                    }, label: {
                        VStack {
                            WebImage(url: URL(string: viewModel.meal.image))
                                .resizable()
                                .indicator(.activity)
                                .transition(.fade(duration: 0.5))
                                .scaledToFill()
                                .frame(width: screenSize.scaleWidth(200) ,height: screenSize.scaleHeight(160))
                                .cornerRadius(4)
                                .clipped()
                                .background {
                                    if #available(iOS 15.0, *) {
                                        Color.gray.opacity(0.3)
                                    } else {
                                        EmptyView()
                                    }
                                }
                            CSpace(height: screenSize.scaleHeight(10))
                            Text(viewModel.meal.name)
                                .font(.yuGothicUILight(size: screenSize.scaleHeight(20)))
                                .foregroundColor(.mainColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            CSpace(height: screenSize.scaleHeight(5))
                            Text(viewModel.meal.address)
                                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                                .foregroundColor(.bodyTextColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            CSpace(height: screenSize.scaleHeight(10))
                            HStack {
                                OrangeRatingText(screenSize: screenSize, viewModel: OrangeRatingTextViewModel(rating: viewModel.meal.rating))
                                CSpace(width: screenSize.scaleWidth(10))
                                Text(viewModel.meal.time)
                                    .font(.yuGothicLight(size: screenSize.scaleHeight(14)))
                                    .foregroundColor(.mainColor)
                                CSpace(width: screenSize.scaleWidth(10))
                                Circle()
                                    .fill(Color.bodyTextColor)
                                    .frame(width: 5, height: 5)
                                CSpace(width: screenSize.scaleWidth(10))
                                feeShipText(screenSize: screenSize)
                                Spacer()
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 0)

                    })
            )
    }
    
    @ViewBuilder
    private func feeShipText(screenSize: ScreenSize) -> some View {
        if viewModel.meal.feeShip == 0 {
            Text("Free delivery")
                .font(.yuGothicLight(size: screenSize.scaleHeight(14)))
                .foregroundColor(.mainColor)
        } else {
            Text("\(displayNumber(viewModel.meal.feeShip))$")
                .font(.yuGothicLight(size: screenSize.scaleHeight(14)))
                .foregroundColor(.mainColor)
        }
    }
}

#Preview {
    HorizontalHomeView(screenSize: ScreenSize(width: 375, height: 812), action: { print("Go To Detail")}, viewModel: HorizontalHomeViewModel(meal: Meal(image: "https://www.holidify.com/images/cmsuploads/compressed/c700x420_20181227132950.jpg", name: "Sushi", typeFood: "Sea Food", price: 5, address: "Tokyo, Japan", nation1: "Japan", nation2: "Japan", time: "10min", rating: "5.0", totalVote: 1123, fee: 1, idMeal: 0), typeList: .featurePartners))
}
