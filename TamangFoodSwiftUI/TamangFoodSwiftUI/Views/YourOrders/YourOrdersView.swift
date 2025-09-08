//
//  YourOrdersView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 5/9/25.
//

import SwiftUI

struct YourOrdersView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: YourOrdersViewModel
    @EnvironmentObject var router: MainNavigationRouter
    
    var body: some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize(width: geometry.size.width, height: geometry.size.height)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    LazyVStack {
                        ForEach(viewModel.dummyOrderMeal.indices, id: \.self) { index in
                            let item = viewModel.dummyOrderMeal[index]
                            ItemOrderView(viewModel: ItemOrderViewModel(order: item, indexID: index + 1), screenSize: screenSize)
                        }
                    }
                    CSpace(height: screenSize.scaleHeight(16))
                    HStack {
                        Text(AppFood.String.subTotalString)
                            .mainUIRegularText(size: screenSize.scaleHeight(16))
                        Spacer()
                        Text("\(AppFood.String.dollarsString)$30")
                            .mainUIRegularText(size: screenSize.scaleHeight(16))
                    }
                    CSpace(height: screenSize.scaleHeight(24))
                    HStack {
                        Text(AppFood.String.deliveryDetailString)
                            .mainUIRegularText(size: screenSize.scaleHeight(16))
                        Spacer()
                        Text("$3")
                            .mainUIRegularText(size: screenSize.scaleHeight(16))
                    }
                    CSpace(height: screenSize.scaleHeight(24))
                    HStack {
                        Spacer()
                        Text("Dollars$30")
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundStyle(Color.myAccentColor)
                    }
                    CSpace(height: screenSize.scaleHeight(28))
                    HStack {
                        Text(AppFood.String.addMoreItemString)
                            .font(.yuGothicUILight(size: screenSize.scaleHeight(16)))
                            .foregroundStyle(Color.myAccentColor)
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image("right_arrow")
                        })
                    }
                    Color(hex: "#F6F6F6")
                        .frame(height: 1)
                    CSpace(height: screenSize.scaleHeight(10))
                    HStack {
                        Text(AppFood.String.promoCodeString)
                            .mainUIRegularText(size: screenSize.scaleHeight(16))
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image("right_arrow")
                        })
                    }
                    Color(hex: "#F6F6F6")
                        .frame(height: 1)
                    CSpace(height: screenSize.scaleHeight(47))
                    OrangeButton(titleButton: "CONTINUE (DOLLARS $30)", screenSize: screenSize) {
                        router.push(.paymentMethod)
                        print("avcdasd")
                    }
                }
            }
            .padding(.horizontal, screenSize.scaleWidth(20))
            .navigationTitle(Text(AppFood.String.yourOrderTitle))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
//                        router.dismissFullScreen()
                        router.goBack()
                    }) {
                        Image(AppFood.StringImage.blackCloseIcon)
                    }
                }
            }
        }
    }
}

#Preview {
    YourOrdersView(viewModel: YourOrdersViewModel())
}
