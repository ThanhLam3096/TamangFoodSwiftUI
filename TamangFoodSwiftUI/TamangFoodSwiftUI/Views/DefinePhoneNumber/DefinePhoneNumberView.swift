//
//  DefinePhoneNumberView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 5/5/25.
//

import SwiftUI

struct DefinePhoneNumberView: View {
    
    @State private var screenSizeManager = ScreenSizeManager()
    @Environment(\.presentationMode) var presentationMode
    @State private var phoneNumber: String = ""
    @State private var isSuccessSignUp: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            Color.clear.onAppear {
                if screenSizeManager.screenSize == .zero {
                    screenSizeManager.updateScreenSize(size: size)
                }
            }
            let screenSize = ScreenSize(from: screenSizeManager.screenSize == .zero ? size : screenSizeManager.screenSize)
            VStack {
                NavigationBarView(screenSize: screenSize, title: AppText.titleDefinePhoneNumber) {
                    dismissView(presentationMode)
                }
                VStack {
                    Text(AppText.title2DefinePhoneNumber)
                        .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
                        .foregroundStyle(Color.mainColor)
                    CSpace(height: screenSize.scaleHeight(20))
                    Text(AppText.descriptionDefinePhoneNumber)
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                        .foregroundStyle(Color.bodyTextColor)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, screenSize.scaleWidth(10))
                    CSpace(height: screenSize.scaleHeight(20))
                    Text(AppText.titlePhoneNumberTextField)
                        .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CSpace(height: screenSize.scaleHeight(8))
                    HStack {
                        Image("VietNam")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: screenSize.scaleWidth(32), height: screenSize.scaleHeight(24))
                        Button {
                            print("Show all flags")
                        } label: {
                            Image("pathDown")
                        }
                        TextField("", text: $phoneNumber)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundStyle(Color.mainColor)
                            .tint(Color.accentColor)
                    }
                    CSpace(height: screenSize.scaleHeight(10))
                    Color(hex: "#F6F6F6")
                        .frame(height: 1)
                    CSpace(height: screenSize.scaleHeight(400))
                    OrangeButton(titleButton: AppText.signUpText, screenSize: screenSize) {
                        isSuccessSignUp = true
                    }
                    .navigationDestination(isPresented: $isSuccessSignUp) {
                        DefinePhoneNumberView()
                    }
                }
                .padding(.horizontal, screenSize.scaleWidth(20))
            }
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarHidden(true)
    }
}

#Preview {
    DefinePhoneNumberView()
}
