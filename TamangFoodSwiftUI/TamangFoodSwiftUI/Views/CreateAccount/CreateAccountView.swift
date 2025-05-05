//
//  CreateAccountView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 5/5/25.
//

import SwiftUI

struct CreateAccountView: View {
    @StateObject private var emailViewModel = TextFieldFormInfoViewModel()
    @StateObject private var passwordViewModel = TextFieldFormInfoViewModel()
    @StateObject private var fullNameViewModel = TextFieldFormInfoViewModel()
    @StateObject private var screenSizeManager = ScreenSizeManager()
    @StateObject private var textWidthViewModel = TextWidthViewModel()
    @State private var textWidth: CGFloat = 0
    @ObservedObject private var keyboard = KeyboardResponder()
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
            CreateAccountViewContent(
                screenSize: resolvedSize,
                fullNameViewModel: fullNameViewModel,
                emailViewModel: emailViewModel,
                passwordViewModel: passwordViewModel,
                textWidthViewModel: textWidthViewModel,
                keyboard: keyboard,
                textWidth: $textWidth,
                presentationMode: presentationMode
            )
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarHidden(true)
    }
}

struct CreateAccountViewContent: View {
    let screenSize: ScreenSize
        @ObservedObject var fullNameViewModel: TextFieldFormInfoViewModel
        @ObservedObject var emailViewModel: TextFieldFormInfoViewModel
        @ObservedObject var passwordViewModel: TextFieldFormInfoViewModel
        @ObservedObject var textWidthViewModel: TextWidthViewModel
        @ObservedObject var keyboard: KeyboardResponder
        @Binding var textWidth: CGFloat
        var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        ScrollView {
            VStack {
                NavigationBarView(screenSize: screenSize, title: AppText.titleCreateAccount) {
                    dismissView(presentationMode)
                }
                VStack {
                    Text(AppText.titleCreateAccount)
                        .font(.yuGothicUILight(size: screenSize.scaleHeight(33)))
                        .foregroundStyle(Color.mainColor)
                        .frame(width: screenSize.scaleWidth(338), alignment: .leading)
                    CSpace(height: screenSize.scaleHeight(20))
                    ZStack(alignment: .bottomLeading) {
                        Text(AppText.descriptionCreateAccount)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .lineSpacing(5)
                            .foregroundStyle(Color.bodyTextColor)
                            .frame(width: screenSize.scaleWidth(338), alignment: .leading)
                        TextWidthReader(
                            text: "for sign up.  ",
                            font: UIFont.fontYugothicUIRegular(ofSize: screenSize.scaleHeight(16)) ?? .systemFont(ofSize: 16), // Dùng UIFont để tính toán chiều rộng
                            textWidth: $textWidth
                        )
                        .hidden()
                        Button {
                            dismissView(presentationMode)
                        } label: {
                            Text(AppText.alreadyHaveAccountText)
                                .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                                .foregroundStyle(Color.activeColor)
                                .padding(.leading, textWidth)
                        }
                    }
                    CSpace(height: screenSize.scaleHeight(20))
                    TextFieldFormInfo(title: AppText.fullNameTitleTextField, screenSize: screenSize, isPasswordForm: false, viewModel: emailViewModel)
                    CSpace(height: screenSize.scaleHeight(18))
                    TextFieldFormInfo(title: AppText.emailTitleTextField, screenSize: screenSize, isPasswordForm: false, viewModel: emailViewModel)
                    CSpace(height: screenSize.scaleHeight(18))
                    TextFieldFormInfo(title: AppText.passwordTitleTextField, screenSize: screenSize, isPasswordForm: true, viewModel: passwordViewModel)
                    CSpace(height: screenSize.scaleHeight(39))
                    OrangeButton(titleButton: AppText.signUpText, screenSize: screenSize) {
                        print("Go next Screen")
                    }
                    CSpace(height: screenSize.scaleHeight(20))
                    Text(AppText.conditionText)
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                        .foregroundStyle(Color.bodyTextColor)
                        .multilineTextAlignment(.center)
                    CSpace(height: screenSize.scaleHeight(20))
                    Text(AppText.orText)
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                        .foregroundStyle(Color.mainColor)
                    CSpace(height: screenSize.scaleHeight(20))
                    SocialButton(socialType: .facebook, screenSize: screenSize)
                    CSpace(height: screenSize.scaleHeight(15))
                    SocialButton(socialType: .google, screenSize: screenSize)
                }
                .padding(.horizontal, screenSize.scaleWidth(20))
            }
            .padding(.bottom, keyboard.keyboardHeight)
            .animation(.easeOut(duration: 0.3), value: keyboard.keyboardHeight)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    CreateAccountView()
}
