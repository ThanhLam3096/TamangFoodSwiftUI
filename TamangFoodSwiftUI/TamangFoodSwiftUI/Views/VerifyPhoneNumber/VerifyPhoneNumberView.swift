//
//  VerifyPhoneNumberView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 6/5/25.
//

import SwiftUI

struct VerifyPhoneNumberView: View {
    
    @State private var screenSizeManager = ScreenSizeManager()
    @Environment(\.presentationMode) var presentationMode
    @FocusState private var focusedIndex: Int?
    @State private var code: [String] = Array(repeating: "", count: 4)
    @ObservedObject private var keyboard = KeyboardResponder()
    
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
                NavigationBarView(screenSize: screenSize, title: AppText.titleNaviVerifyPhoneNumber) {
                    dismissView(presentationMode)
                }
                ScrollView {
                    CSpace(height: screenSize.scaleHeight(24))
                    VStack {
                        Text(AppText.titleVerifyPhoneNumber)
                            .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
                            .foregroundStyle(Color.mainColor)
                        CSpace(height: screenSize.scaleHeight(20))
                        Text(AppText.descriptionVerifyPhoneNumber)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundStyle(Color.mainColor)
                            .multilineTextAlignment(.center)
                        CSpace(height: screenSize.scaleHeight(41))
                        PasscodeInputView(
                            screenSize: screenSize,
                            code: $code,
                            focusedIndex: _focusedIndex
                        )
                        .onAppear {
                            focusedIndex = 0
                        }
                        if keyboard.isKeyboardVisible {
                            CSpace(height: screenSize.scaleHeight(34))
                        } else {
                            CSpace(height: screenSize.scaleHeight(304))
                        }
                        OrangeButton(titleButton: AppText.continueText, screenSize: screenSize) {
                            print("abcd")
                        }
                        CSpace(height: screenSize.scaleHeight(24))
                        HStack {
                            Text(AppText.didNotReceiveCodeText)
                                .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                                .frame(width: screenSize.scaleWidth(120), alignment: .leading)
                            Button {
                                print("Resend Code")
                            } label: {
                                Text(AppText.resendText)
                                    .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                                    .frame(width: screenSize.scaleWidth(100), alignment: .trailing)
                                    .foregroundStyle(Color.activeColor)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        CSpace(height: screenSize.scaleHeight(34))
                        Text(AppText.policyText)
                            .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                            .foregroundStyle(Color.bodyTextColor)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, screenSize.scaleWidth(20))
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                hideKeyboard()
            }
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarHidden(true)
    }
}

struct PasscodeInputView: View {
    let screenSize: ScreenSize
    @Binding var code: [String]
    @FocusState var focusedIndex: Int?
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<code.count, id: \.self) { index in
                TextField("", text: Binding(
                    get: { code[index] },
                    set: { newValue in
                        if newValue.count <= 1 {
                            code[index] = newValue
                            if !newValue.isEmpty && index < code.count - 1 {
                                focusedIndex = index + 1
                            }
                        }
                    }
                ))
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .multilineTextAlignment(.center)
                .font(.yuGothicUILight(size: screenSize.scaleHeight(16)))
                .frame(width: screenSize.scaleHeight(50), height: screenSize.scaleHeight(50))
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .tint(.greenColor)
                .focused($focusedIndex, equals: index)
            }
        }
    }
}

#Preview {
    VerifyPhoneNumberView()
}
