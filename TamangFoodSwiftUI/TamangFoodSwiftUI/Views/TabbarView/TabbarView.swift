//
//  TabbarView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 19/6/25.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, search, orders, message, profile
    }
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack(path: $router.path) {
                HomeView()
                    .navigationDestination(for: Router.self) { route in
                        switch route {
                        case .seeAll(let meals, let title):
                            SeeAllFoodView(viewModel: SeeAllFoodViewModel(meals: meals, title: title))
                        case .detail(let meal):
                            DetailView(viewModel: DetailViewModel(meal: meal))
                        case .addToOrder(meal: let meal):
                            AddToOrderView(viewModel: AddToOrderViewModel(meal: meal))
                        case .yourOrder:
                            YourOrdersView(viewModel: YourOrdersViewModel())
                        }
                    }
            }
                .tabItem {
                    tabItemView(
                        imageName: selectedTab == .home ? "home_tabbar_selected" : "home_tabbar",
                        title: "Home",
                        isSelected: selectedTab == .home
                    )
                }
                .tag(Tab.home)
            
            SearchView()
                .tabItem {
                    tabItemView(
                        imageName: selectedTab == .search ? "search_tabbar_selected" : "search_tabbar",
                        title: "Search",
                        isSelected: selectedTab == .search
                    )
                }
                .tag(Tab.search)
            
            OrdersView()
                .tabItem {
                    tabItemView(
                        imageName: selectedTab == .orders ? "order_tabbar_selected" : "order_tabbar",
                        title: "Orders",
                        isSelected: selectedTab == .orders
                    )
                }
                .tag(Tab.orders)
            
            ProfileView()
                .tabItem {
                    tabItemView(
                        imageName: selectedTab == .profile ? "profile_tabbar_selected" : "profile_tabbar",
                        title: "Profile",
                        isSelected: selectedTab == .profile
                    )
                }
                .tag(Tab.profile)
        }
        .tint(Color.myAccentColor)
        .fullScreenCover(item: $router.presentedFullScreen) { router in
            switch router {
            case .yourOrder:
                YourOrdersView(viewModel: YourOrdersViewModel())
            default: EmptyView()
            }
        }
        .environmentObject(router)
    }
    
    // MARK: - TabItem View
    @ViewBuilder
    private func tabItemView(imageName: String, title: String, isSelected: Bool) -> some View {
        VStack {
            Image(imageName)
                .renderingMode(.original)
            Text(title)
                .font(.yuGothicLight(size: 12))
        }
    }
}

#Preview {
    TabbarView()
}
