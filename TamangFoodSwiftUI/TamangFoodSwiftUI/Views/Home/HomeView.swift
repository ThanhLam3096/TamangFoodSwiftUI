//
//  HomeView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 15/5/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewVM()
    @StateObject private var headerVM = HeaderHomeViewVM()
    @State private var isExpanded: Bool = false
    @State private var currentIndex = 0
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize(width: geometry.size.width, height: geometry.size.height)
            ScrollView {
                VStack {
                    HeaderHomeView(heightOfHeader: screenSize.scaleHeight(70), screenSize: screenSize, viewModel: headerVM, isExpanded: $isExpanded)
                    ZStack {
                        TabView(selection: $currentIndex) {
                            ForEach(viewModel.listSliderFoodImage.indices, id: \.self) { index in
                                Image(viewModel.listSliderFoodImage[index])
                                    .resizable()
                                    .scaledToFill()
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: screenSize.scaleHeight(200))
                        .cornerRadius(18)
                        .clipped()
                        .onAppear {
                            startTimer()
                        }
                        .padding(.horizontal, screenSize.scaleWidth(20))
                        if isExpanded {
                            listLocation(screenSize: screenSize)
                                .zIndex(1)
                                .offset(y: screenSize.scaleHeight(-30))
                        }
                    }
                    HStack {
                        Text("Featured\nPartners")
                            .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
                            .foregroundStyle(Color.mainColor)
                        Spacer()
                        Button {
                            router.goToSeeAll(meals: viewModel.listMealFeaturePartners, title: "Feature Partners")
                        } label: {
                            Text("See all")
                                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                                .foregroundStyle(Color.activeColor)
                        }
                    }
                    .padding(.horizontal, screenSize.scaleWidth(20))
                    .padding(.bottom, screenSize.scaleHeight(-5))
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(viewModel.listMealFeaturePartners, id: \.idMeal) { item in
                                HorizontalHomeView(screenSize: screenSize, action: {
                                    router.goToDetail(meal: item)
                                }, viewModel: HorizontalHomeViewModel(meal: item, typeList: .featurePartners))
                            }
                        }
                        .padding(.horizontal, screenSize.scaleWidth(20))
                    }
                    .onAppear(perform: fetchFeaturePartners)
                    Image("Banner")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenSize.width - screenSize.scaleWidth(40),height: screenSize.scaleHeight(210))
                    HStack {
                        Text("Best Picks\nRestaurants by\nteam")
                            .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
                            .foregroundStyle(Color.mainColor)
                        Spacer()
                        Button {
                            router.goToSeeAll(meals: viewModel.listNationFood, title: "National Specialties")
                        } label: {
                            Text("See all")
                                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                                .foregroundStyle(Color.activeColor)
                        }
                    }
                    .padding(.horizontal, screenSize.scaleWidth(20))
                    .padding(.bottom, screenSize.scaleHeight(-5))
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(viewModel.listNationFood, id: \.idMeal) { item in
                                HorizontalHomeView(screenSize: screenSize, action: {
                                    router.goToDetail(meal: item)
                                }, viewModel: HorizontalHomeViewModel(meal: item, typeList: .featurePartners))
                            }
                        }
                        .padding(.horizontal, screenSize.scaleWidth(20))
                    }
                    .onAppear(perform: fetchNationFood)
                    HStack {
                        Text("All Restaurants")
                            .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
                            .foregroundStyle(Color.mainColor)
                        Spacer()
                        Button {
                            print("See All")
                        } label: {
                            Text("See all")
                                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                                .foregroundStyle(Color.activeColor)
                        }
                    }
                    .padding(.horizontal, screenSize.scaleWidth(20))
                    .padding(.bottom, screenSize.scaleHeight(-5))
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.listRestaurants, id: \.id) { item in
                                RestaurantHomeView(screenSize: screenSize, viewModel: RestaurantHomeViewModel(restaurant: item))
                                    .onTapGesture {
                                        print("Go To Detail Food")
                                    }
                            }
                        }
                    }
                    .onAppear(perform: fetchRestaurants)
                }
            }
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % viewModel.listSliderFoodImage.count
            }
        }
    }
    
    @ViewBuilder
    private func listLocation(screenSize: ScreenSize) -> some View {
        List(viewModel.listLocation, id: \.self) { location in
            Button(action: {
                print("Your Choose \(location)")
                headerVM.locationString = location
                isExpanded.toggle()
            }) {
                Text(location)
                    .foregroundStyle(Color.mainColor)
                    .font(.yuGothicLight(size: screenSize.scaleHeight(20)))
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .listStyle(.plain)
        .frame(width: screenSize.scaleWidth(200) ,height: screenSize.scaleHeight(150))
        .background(Color.gray.opacity(0.1))
        //                        .transition(.move(edge: .bottom))
        .transition(.asymmetric(insertion: .move(edge: .top), removal: .opacity))
        .animation(.easeInOut(duration: 0.3), value: isExpanded)
    }
    
    // MARK: - API Calls
    private func fetchFeaturePartners() {
        guard viewModel.listMealFeaturePartners.isEmpty else { return }
        viewModel.getAPIListFeaturePartners { success, message in
            print(success ? "Load Data Feature Partners Success" : "Failed Feature Parners: \(message)")
        }
    }
    
    private func fetchNationFood() {
        guard viewModel.listNationFood.isEmpty else { return }
        viewModel.getAPIListNationFood { success, message in
            print(success ? "Load Data Nation Food Success" : "Failed Nation: \(message)")
        }
    }
    
    private func fetchRestaurants() {
        guard viewModel.listRestaurants.isEmpty else { return }
        viewModel.getAPIListRestaurant { success, message in
            print(success ? "Load Data Restaurants Success" : "Failed Restaurants: \(message)")
        }
    }
}

#Preview {
    HomeView()
}
