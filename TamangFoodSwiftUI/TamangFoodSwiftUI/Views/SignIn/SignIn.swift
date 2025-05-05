//
//  SignIn.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 27/4/25.
//

import SwiftUI

struct SignIn: View {
    @StateObject private var emailViewModel = TextFieldFormInfoViewModel()
    @StateObject private var passwordViewModel = TextFieldFormInfoViewModel()
    @StateObject private var screenSizeManager = ScreenSizeManager()
//    @State private var path: [SignInRoute] = []
    @StateObject private var viewModel = SignInViewModel()
//    @Binding var path: [SignInRoute]
    
    var body: some View {
//        NavigationStack(path: $path) {
            GeometryReader { geometry in
                let size = geometry.size
                Color.clear.onAppear {
                    if screenSizeManager.screenSize == .zero {
                        screenSizeManager.updateScreenSize(size: size)
                    }
                }
                SignInContent(
                    screenSize: ScreenSize(from: screenSizeManager.screenSize == .zero ? size : screenSizeManager.screenSize),
                    emailViewModel: emailViewModel,
                    passwordViewModel: passwordViewModel,
                    viewModel: viewModel
//                    path: $path
                )
            }
            .ignoresSafeArea(.keyboard)
            .navigationBarHidden(true)
//            .navigationDestination(for: SignInRoute.self) { route in
//                switch route {
//                case .forgetPassword:
//                    ForgotPassword()
//                case .createAccount:
//                    CreateAccountView()
//                }
//            }
//        }
    }
}

struct SignInContent: View {
    let screenSize: ScreenSize
    @ObservedObject var emailViewModel: TextFieldFormInfoViewModel
    @ObservedObject var passwordViewModel: TextFieldFormInfoViewModel
    @ObservedObject private var keyboard = KeyboardResponder()
    @ObservedObject var viewModel: SignInViewModel
//    @Binding var path: [SignInRoute]
    
    var body: some View {
//        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    NavigationBarView(screenSize: screenSize, title: AppText.titleSignIn) {
                        print("Back tapped")
                    }
                    VStack {
                        Text(AppText.welcomeSignIn)
                            .font(.yuGothicUILight(size: screenSize.scaleHeight(33)))
                            .foregroundStyle(Color.mainColor)
                            .frame(width: screenSize.scaleWidth(338), alignment: .leading)
                        CSpace(height: screenSize.scaleHeight(20))
                        Text(AppText.descriptionSignIn)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .lineSpacing(5)
                            .foregroundStyle(Color.bodyTextColor)
                            .frame(width: screenSize.scaleWidth(338), alignment: .leading)
                        CSpace(height: screenSize.scaleHeight(20))
                        TextFieldFormInfo(title: AppText.emailTitleTextField, screenSize: screenSize, isPasswordForm: false, viewModel: emailViewModel)
                        CSpace(height: screenSize.scaleHeight(18))
                        TextFieldFormInfo(title: AppText.passwordTitleTextField, screenSize: screenSize, isPasswordForm: true, viewModel: passwordViewModel)
                        CSpace(height: screenSize.scaleHeight(25))
                        Button(action: {
//                            path.append(.forgetPassword)
                            viewModel.moveToScreenForgotPassword()
                        }) {
                            Text(AppText.forgetPassword)
                                .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                                .foregroundStyle(Color.bodyTextColor)
                        }
                        .navigationDestination(isPresented: $viewModel.moveToForgotPassword) {
                            ForgotPassword()
                        }
                        CSpace(height: screenSize.scaleHeight(39))
                        OrangeButton(titleButton: AppText.signInText, screenSize: screenSize) {
                            print("Go next Screen")
                        }
                        CSpace(height: screenSize.scaleHeight(20))
                        HStack {
                            Text(AppText.dontHaveAccountText)
                                .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                                .foregroundStyle(Color.mainColor)
                            CSpace(width: screenSize.scaleWidth(20))
                            Button {
//                                path.append(.createAccount)
                                viewModel.moveToScreenCreateAccount()
                            } label: {
                                Text(AppText.createNewAccountText)
                                    .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                                    .foregroundStyle(Color.activeColor)
                            }
                        }
                        .navigationDestination(isPresented: $viewModel.moveToCreateAccount) {
                            CreateAccountView()
                        }
                        .frame(width: screenSize.scaleWidth(249))
                        CSpace(height: screenSize.scaleHeight(20))
                        Text(AppText.orText)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundStyle(Color.mainColor)
                        CSpace(height: screenSize.scaleHeight(20))
                        SocialButton(socialType: .facebook, screenSize: screenSize)
                        CSpace(height: screenSize.scaleHeight(15))
                        SocialButton(socialType: .google, screenSize: screenSize)
//                        Spacer().frame(height: screenSize.scaleHeight(150)).id("ScrollTarget")
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
//            .onChange(of: keyboard.isKeyboardVisible) {
//                if keyboard.isKeyboardVisible {
//                    withAnimation {
//                        proxy.scrollTo("ScrollTarget", anchor: .top)
//                    }
//                } else {
//                    
//                }
//            }
//        }
    }
}

#Preview {
    SignIn()
}
