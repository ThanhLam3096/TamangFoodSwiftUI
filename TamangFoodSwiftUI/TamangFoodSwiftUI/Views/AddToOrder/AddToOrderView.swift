//
//  AddToOrderView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 31/8/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct AddToOrderView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: AddToOrderViewModel
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize(width: geometry.size.width, height: geometry.size.height)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack(alignment: .topLeading) {
                        WebImage(url: URL(string: viewModel.meal.image))
                            .resizable()
                            .frame(width: screenSize.width, height: screenSize.scaleHeight(280))
                        Button(action: {
                            router.goBack()
                        }) {
                            Image("close")
                                .resizable()
                                .frame(width: screenSize.scaleWidth(20), height: screenSize.scaleWidth(20))
                        }
                        .frame(width: screenSize.scaleWidth(44), height: screenSize.scaleWidth(44))
                        .background(Circle().fill(Color.black.opacity(0.4)))
                        .padding(.top, screenSize.scaleHeight(37))
                        .padding(.leading, screenSize.scaleHeight(20))
                    }
                    CSpace(height: screenSize.scaleHeight(24))
                    VStack(alignment: .leading) {
                        Text(viewModel.meal.name)
                            .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
                            .foregroundStyle(Color.mainColor)
                        CSpace(height: screenSize.scaleHeight(16))
                        if !viewModel.customSpiceTop.isEmpty && !viewModel.customSpiceBottom.isEmpty {
                            Text("\(viewModel.customSpiceTop), and \(viewModel.customSpiceBottom)")
                                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                                .foregroundStyle(Color.mainColor)
                        } else {
                            EmptyView()
                        }
                        CSpace(height: screenSize.scaleHeight(21))
                        HStack {
                            Text("\(displayNumber(viewModel.meal.price))$").bodyUIRegularText(size: screenSize.scaleHeight(16))
                            CSpace(width: screenSize.scaleWidth(15))
                            Circle()
                                .fill(Color.bodyTextColor)
                                .frame(width: 5.5, height: 5.5)
                            CSpace(width: screenSize.scaleWidth(10))
                            Text(viewModel.meal.nation1).bodyUIRegularText(size: screenSize.scaleHeight(16))
                            CSpace(width: screenSize.scaleWidth(15))
                            Circle()
                                .fill(Color.bodyTextColor)
                                .frame(width: 5.5, height: 5.5)
                            CSpace(width: screenSize.scaleWidth(10))
                            Text(viewModel.meal.nation2).bodyUIRegularText(size: screenSize.scaleHeight(16))
                            CSpace(width: screenSize.scaleWidth(15))
                            Circle()
                                .fill(Color.bodyTextColor)
                                .frame(width: 5.5, height: 5.5)
                            CSpace(width: screenSize.scaleWidth(10))
                            Text(viewModel.meal.typeFood).bodyUIRegularText(size: screenSize.scaleHeight(16))
                        }
                        CSpace(height: screenSize.scaleHeight(34))
                        LazyVStack {
                            Section {
                                ForEach(viewModel.listChoice, id: \.self) { item in
                                    ChoiceSpiceView(screenSize: screenSize, viewModel: ChoiceSpiceViewModel(spice: item, isSelectedSpice: viewModel.customSpiceTop == item), action: {
                                        choiceCustomTopSpice(data: item)
                                    })
                                }
                            } header: {
                                HeaderSpiceView(screenSize: screenSize, viewModel: HeaderSpiceViewModel(titleHeader: "Choice of Top Spice", data: viewModel.customSpiceTop))
                            }
                        }
                        CSpace(height: screenSize.scaleHeight(34))
                        LazyVStack {
                            Section {
                                ForEach(viewModel.listChoice, id: \.self) { item in
                                    ChoiceSpiceView(screenSize: screenSize, viewModel: ChoiceSpiceViewModel(spice: item, isSelectedSpice: viewModel.customSpiceBottom == item), action: {
                                        choiceCustomBottomSpice(data: item)
                                    })
                                }
                            } header: {
                                HeaderSpiceView(screenSize: screenSize, viewModel: HeaderSpiceViewModel(titleHeader: "Choice of Bottom Spice", data: viewModel.customSpiceBottom))
                            }
                        }
                        CSpace(height: screenSize.scaleHeight(21))
                        FooterListSpiceView(screenSize: screenSize)
                        CSpace(height: screenSize.scaleHeight(34))
                        HStack(alignment: .center) {
                            Button(action: {
                                viewModel.minusAction()
                            }, label: {
                                Image("minus")
                                    .frame(width: screenSize.scaleWidth(54), height: screenSize.scaleWidth(54))
                                    .background(
                                        Circle()
                                            .fill(Color.cacuColor)
                                    )
                            })
                            CSpace(width: screenSize.scaleWidth(24))
                            Text("\(viewModel.updateNumberOfMeals(numberOfMeals: viewModel.numberOfMeals))")
                            CSpace(width: screenSize.scaleWidth(24))
                            Button(action: {
                                viewModel.plusAction()
                            }, label: {
                                Image("plus")
                                    .frame(width: screenSize.scaleWidth(54), height: screenSize.scaleWidth(54))
                                    .background(
                                        Circle()
                                            .fill(Color.cacuColor)
                                    )
                            })
                        }
                        .frame(maxWidth: .infinity)
                        CSpace(height: screenSize.scaleHeight(44))
                        OrangeButton(titleButton: "ADD TO ORDER ($\(displayNumber(viewModel.totalOfPriceMeal)))", screenSize: screenSize) {
                            router.presentFullScreen(.yourOrder)
                        }
                        CSpace(height: screenSize.scaleHeight(50))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, screenSize.scaleWidth(20))
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
    
    // MARK: Fuctional
    private func choiceCustomTopSpice(data: String) {
        viewModel.customSpiceTop = data
        print("Choice Spice Top == \(data)")
    }
    
    // MARK: Fuctional
    private func choiceCustomBottomSpice(data: String) {
        viewModel.customSpiceBottom = data
        print("Choice Spice Bottom == \(data)")
    }
}

#Preview {
    AddToOrderView(viewModel: AddToOrderViewModel(meal: Meal(image: "https://www.holidify.com/images/cmsuploads/compressed/c700x420_20181227132950.jpg", name: "Sushi", typeFood: "Sea Food", price: 5, address: "Tokyo, Japan", nation1: "Japan", nation2: "Japan", time: "10min", rating: "5.0", totalVote: 1123, fee: 1, idMeal: 0)))
}
