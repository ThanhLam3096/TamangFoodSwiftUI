//
//  ForgotPassword.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 4/5/25.
//

import SwiftUI

struct ForgotPassword: View {
    @StateObject private var emailViewModel = TextFieldFormInfoViewModel()
    @StateObject private var screenSizeManager = ScreenSizeManager()
    @StateObject private var viewModel = ForgotPasswordViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            Color.clear.onAppear {
                if screenSizeManager.screenSize == .zero {
                    screenSizeManager.updateScreenSize(size: size)
                }
            }
            let resolvedSize = ScreenSize(from: screenSizeManager.screenSize == .zero ? size : screenSizeManager.screenSize)
            VStack {
                NavigationBarView(screenSize: resolvedSize, title: AppText.titleNaviForgotPassword) {
                    presentationMode.wrappedValue.dismiss()
                }
                ZStack(alignment: .top) {
                    if viewModel.isResendEmail {
                        ForgotPassowrdContentView(
                            emailViewModel: emailViewModel,
                            viewModel: viewModel,
                            screenSize: resolvedSize
                        )
                        .hidden()
                        ForgotPassowrdContentView2(screenSize: resolvedSize)
                    } else {
                        ForgotPassowrdContentView(
                            emailViewModel: emailViewModel, viewModel: viewModel,
                            screenSize: resolvedSize
                        )
                        ForgotPassowrdContentView2(screenSize: resolvedSize)
                        .hidden()
                    }
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarHidden(true)
    }
}

struct ForgotPassowrdContentView: View {
    @ObservedObject var emailViewModel: TextFieldFormInfoViewModel
    @ObservedObject var viewModel: ForgotPasswordViewModel
    let screenSize: ScreenSize
    
    var body: some View {
        VStack {
            Text(AppText.titleForgotPassword)
                .font(.yuGothicUILight(size: screenSize.scaleHeight(33)))
                .foregroundStyle(Color.mainColor)
                .frame(width: screenSize.scaleWidth(338), alignment: .leading)
            CSpace(height: screenSize.scaleHeight(20))
            Text(AppText.descriptionForgotPassword)
                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                .lineSpacing(5)
                .foregroundStyle(Color.bodyTextColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
            CSpace(height: screenSize.scaleHeight(20))
            TextFieldFormInfo(title: AppText.emailTitleTextField, screenSize: screenSize, isPasswordForm: false, viewModel: emailViewModel)
            CSpace(height: screenSize.scaleHeight(20))
            OrangeButton(titleButton: AppText.resetPasswordText, screenSize: screenSize) {
                viewModel.isResendEmail = true
            }
        }
        .padding(.horizontal, screenSize.scaleWidth(20))
    }
    
}

struct ForgotPassowrdContentView2: View {
    let screenSize: ScreenSize
    @State private var textWidth: CGFloat = 0
    @StateObject private var viewModel = TextWidthViewModel()
    
    var body: some View {
        VStack {
            Text(AppText.titleForgotPassword2)
                .font(.yuGothicUILight(size: screenSize.scaleHeight(33)))
                .foregroundStyle(Color.mainColor)
                .frame(width: screenSize.scaleWidth(338), alignment: .leading)
            CSpace(height: screenSize.scaleHeight(20))
            ZStack(alignment: .bottomLeading) {
                Text(AppText.descriptionForgotPassword2)
                    .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                    .lineSpacing(5)
                    .foregroundStyle(Color.bodyTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                TextWidthReader(
                    text: "to sajin tamang@figma.com.  ",
                    font: UIFont.fontYugothicUIRegular(ofSize: screenSize.scaleHeight(16)) ?? .systemFont(ofSize: 16), // Dùng UIFont để tính toán chiều rộng
                    textWidth: $textWidth
                )
                .hidden()
                Text("Having problem?")
                    .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                    .foregroundStyle(Color.activeColor)
                    .padding(.leading, textWidth)
            }
            .fixedSize(horizontal: false, vertical: true)
            CSpace(height: screenSize.scaleHeight(20))
            OrangeButton(titleButton: AppText.sendAgainText, screenSize: screenSize) {
                print("RESEND PASSWORD")
            }
            CSpace(height: screenSize.scaleHeight(150))
            Image(AppText.imageResetCoffe)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenSize.scaleWidth(307), height: screenSize.scaleHeight(237))
        }
        .padding(.horizontal, screenSize.scaleWidth(20))
    }
}

#Preview {
    ForgotPassword()
}
