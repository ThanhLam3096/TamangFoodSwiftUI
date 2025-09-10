//
//  SearchView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 19/6/25.
//

import SwiftUI

struct SearchView: View {
    // MARK: - Properties
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize(width: geometry.size.width, height: geometry.size.height)
            ZStack {
                VStack {
                    headerViewShow(screenSize: screenSize)
                    HStack {
                        Button(action: {
                            
                        }) {
                            Text(AppFood.String.filterString)
                                .mainUIRegularText(size: screenSize.scaleHeight(16))
                        }
                        .frame(height: screenSize.scaleHeight(40))
                        .padding(.horizontal, screenSize.scaleWidth(10))
                        .background(Color.bodyTextColor.opacity(0.2))
                        .cornerRadius(8, corners: .allCorners)
                        CSpace(width: screenSize.scaleWidth(20))
                        Button(action: {
                            viewModel.isNation = true
                            viewModel.isSearchKey = false
                        }) {
                            Text(AppFood.String.nationString)
                                .mainUIRegularText(size: screenSize.scaleHeight(16))
                        }
                        .frame(height: screenSize.scaleHeight(40))
                        .padding(.horizontal, screenSize.scaleWidth(10))
                        .background(Color.accentColor.opacity(0.2))
                        .cornerRadius(8, corners: .allCorners)
                        CSpace(width: screenSize.scaleWidth(20))
                        Button(action: {
                            viewModel.isNation = false
                            viewModel.isSearchKey = false
                        }) {
                            Text(AppFood.String.categoryString)
                                .mainUIRegularText(size: screenSize.scaleHeight(16))
                        }
                        .frame(height: screenSize.scaleHeight(40))
                        .padding(.horizontal, screenSize.scaleWidth(10))
                        .background(Color.myAccentColor.opacity(0.2))
                        .cornerRadius(8, corners: .allCorners)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    CSpace(height: screenSize.scaleHeight(20))
                    if viewModel.isSearchKey {
                        introduceSearchView(screenSize: screenSize)
                    } else {
                        CateAndNationMealCollectionView(viewModel: CateAndNationMealCollectionViewModel(isNation: viewModel.isNation), screenSize: screenSize)
                    }
                }
                .padding(.horizontal, screenSize.scaleWidth(20))
            }
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    @ViewBuilder
    private func introduceSearchView(screenSize: ScreenSize) -> some View {
        VStack {
            Text("Enter Your Name Meal For Search...")
                .font(.yuGothicUISemibold(size: screenSize.scaleHeight(30)))
                .foregroundStyle(Color.myAccentColor)
                .multilineTextAlignment(.center)
            Image("search_waste_food")
                .resizable()
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private func headerViewShow(screenSize: ScreenSize) -> some View {
        if viewModel.isSearchKey {
            VStack {
                CSpace(height: screenSize.scaleHeight(20))
                HeaderSearchView(screenSize: screenSize)
                CSpace(height: screenSize.scaleHeight(20))
            }
            .frame(maxWidth: .infinity)
        } else {
            CSpace(height: screenSize.scaleHeight(20))
            HeaderFilterSearchView(screenSize: screenSize, action: {
                viewModel.isSearchKey = true
            })
            CSpace(height: screenSize.scaleHeight(20))
        }
        
    }
}

#Preview {
    SearchView()
}
