//
//  DetailView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 24/7/25.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = DetailViewModel()
    @State private var selectedMeal: String?
    
    var body: some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize(width: geometry.size.width, height: geometry.size.height)
            ScrollView {
                VStack {
                    Image("Header-image")
                        .resizable()
                        .frame(width: screenSize.width, height: screenSize.scaleHeight(280))
                    CSpace(height: screenSize.scaleHeight(10))
                    InfoDetailMealView(screenSize: screenSize)
                    CSpace(height: screenSize.scaleHeight(34))
                    Text("Featured Items")
                        .font(.yuGothicUILight(size: screenSize.scaleHeight(20)))
                        .foregroundStyle(Color.mainColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, screenSize.scaleWidth(20))
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(dummyMealFeaturePartnes.featurePartnesMeal, id: \.idMeal) { item in
                                FeaturedItemDetailView(screenSize: screenSize, action: {
                                    print("abcd")
                                }, viewModel: FeaturedItemDetailViewModel(meal: item))
                            }
                        }
                        .padding(.horizontal, screenSize.scaleWidth(20))
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(viewModel.typeMeal, id: \.self) { meal in
                                Button(action: {
                                    print("You Choose \(meal)")
                                    selectedMeal = meal
                                    viewModel.listMealByCategory.removeAll()
                                }, label: {
                                    Text(meal)
                                        .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
                                        .foregroundStyle(selectedMeal == meal ? Color.yellowColor : Color.bodyTextColor)
                                })
                            }
                        }
                        .padding(.leading, screenSize.scaleWidth(20))
                    }
                    .onAppear {
                        selectedMeal = viewModel.typeMeal.first
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.listMealByCategory, id: \.idMeal) { item in
                                ListCategoryFoodView(screenSize: screenSize, viewModel: ListCategoryFoodViewModel(mealDB: item))
                            }
                        }
                    }
                    .onAppear {
                        fetchMealByCategory()
                    }
                    .onChange(of: selectedMeal) { // 🔥 UPDATED: fetch Change Category
                        fetchMealByCategory()
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            HStack {
                Button(action: {
                    print("Back")
                }, label: {
                    Image("white_back")
                        .frame(width: screenSize.scaleHeight(34), height: screenSize.scaleHeight(34))
                })
                .padding(.leading, screenSize.scaleWidth(20))
                Spacer()
                Button(action: {
                    print("Share")
                }, label: {
                    Image("Combined_Shape")
                        .frame(width: screenSize.scaleHeight(34), height: screenSize.scaleHeight(34))
                })
                .padding(.trailing, screenSize.scaleWidth(10))
                Button(action: {
                    print("Search")
                }, label: {
                    Image("white_search")
                        .frame(width: screenSize.scaleHeight(34), height: screenSize.scaleHeight(34))
                })
                .padding(.trailing, screenSize.scaleWidth(20))
                
            }
        }
    }
    
    private func fetchMealByCategory() {
            guard let category = selectedMeal else { return }
            guard viewModel.listMealByCategory.isEmpty else { return }
            
            viewModel.getAPIListMealByCategory(categoryName: category) { success, message in
                print(success ? "Load Meal Data Success" : "Failed Fetch MealDB: \(message)")
            }
        }
}

#Preview {
    DetailView()
}
