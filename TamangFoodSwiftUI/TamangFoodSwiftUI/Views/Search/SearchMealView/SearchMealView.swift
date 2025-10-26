//
//  SearchMealView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 13/9/25.
//

import SwiftUI

struct SearchMealView: View {
    
    // MARK: - Properties
    let screenSize: ScreenSizeUIKit
    @ObservedObject var viewModel: SearchMealViewModel
    let actionCancelSearch: () -> Void
    let actionSearch: (String) -> Void
    @FocusState private var isFocused: Bool
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .foregroundStyle(Color.bodyTextColor)
                    .frame(width: screenSize.scaleWidth(20), height: screenSize.scaleWidth(20))
                CSpace(width: screenSize.scaleWidth(10))
                TextField("SEARCH THE MEAL", text: $viewModel.mealSearch)
                    .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
                    .foregroundStyle(Color.mainColor)
                    .tint(Color.myAccentColor)
                    .onSubmit() {
                        actionSearch(viewModel.mealSearch)
                    }
                    .focused($isFocused)
                    .submitLabel(.search)
                CSpace(width: screenSize.scaleWidth(10))
                Button(action: {
                    actionCancelSearch()
                }, label: {
                    Text("Cancel")
                        .mainUIRegularText(size: screenSize.scaleHeight(16))
                })
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    isFocused = true
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            CSpace(height: screenSize.scaleHeight(20))
            HStack {
                Text("RECENT SEARCHES")
                    .font(.yuGothicUILight(size: screenSize.scaleHeight(16)))
                    .foregroundStyle(Color.bodyTextColor)
                Spacer()
                Text("CLEAR ALL")
                    .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                    .foregroundStyle(Color.mainColor)
            }
            CSpace(height: screenSize.scaleHeight(20))
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(spacing: screenSize.scaleHeight(12)) {
                    ForEach(viewModel.historySearchMeal, id: \.self) { item in
                        Button(action: {
                            viewModel.mealSearch = item
                        }, label: {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .foregroundStyle(Color.bodyTextColor)
                                    .frame(width: screenSize.scaleWidth(12), height: screenSize.scaleWidth(12))
                                Text(item)
                                    .mainUIRegularText(size: screenSize.scaleHeight(16))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        })
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .padding(.horizontal, screenSize.scaleWidth(20))
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            print("abcd")
            hideKeyboard()
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    SearchMealView(screenSize: ScreenSizeUIKit(from: UIScreen.main.bounds.size), viewModel: SearchMealViewModel(mealSearch: "abcd"), actionCancelSearch: {}, actionSearch: {_ in })
}
