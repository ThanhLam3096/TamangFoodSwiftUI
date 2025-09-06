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
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize(width: geometry.size.width, height: geometry.size.height)
            NavigationStack {
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
                            Text("Subtotal")
                                .mainUIRegularText(size: screenSize.scaleHeight(16))
                            Spacer()
                            Text("Dollars$30")
                                .mainUIRegularText(size: screenSize.scaleHeight(16))
                        }
                        CSpace(height: screenSize.scaleHeight(24))
                        HStack {
                            Text("Delivery")
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
                            Text("Add more items")
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
                            Text("Promo Code")
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
                            print("abcd")
                        }
                    }
                }
                .padding(.horizontal, screenSize.scaleWidth(20))
                .navigationTitle(Text("Title ở giữa"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            router.dismissFullScreen()
                        }) {
                            Image("black_close")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    YourOrdersView(viewModel: YourOrdersViewModel())
}
