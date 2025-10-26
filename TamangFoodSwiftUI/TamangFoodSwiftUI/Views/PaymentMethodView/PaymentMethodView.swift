//
//  PaymentMethodView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 7/9/25.
//

import SwiftUI

struct PaymentMethodView: View {
    
    // MARK: - Properties
    @EnvironmentObject var router: MainNavigationRouter
    @State private var idCard: String = ""
    @State private var expiryDateCard: String = ""
    @State private var cvcCard: String = ""
    private let screenSize = ScreenSizeUIKit(from: UIScreen.main.bounds.size)
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center) {
                CSpace(height: screenSize.scaleHeight(20))
                Text(AppFood.String.addYourPaymentMethod)
                    .font(.yuGothicUISemibold(size: screenSize.scaleHeight(24)))
                    .foregroundStyle(Color.mainColor)
                CSpace(height: screenSize.scaleHeight(15))
                Text(AppFood.String.subjectMethodsPayment)
                    .bodyUIRegularText(size: screenSize.scaleHeight(16))
                    .multilineTextAlignment(.center)
                CSpace(height: screenSize.scaleHeight(20))
                HStack {
                    Image("card")
                        .resizable()
                        .frame(width: screenSize.scaleWidth(34), height: screenSize.scaleHeight(24))
                        .padding(.horizontal, screenSize.scaleWidth(20))
                    TextField("6969 69696 6969 6969", text: $idCard)
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                        .foregroundStyle(Color.mainColor)
                        .tint(Color.myAccentColor)
                        .frame(height: screenSize.scaleHeight(54))
                        .keyboardType(.numberPad)
                        .onChange(of: idCard) { oldValue, newValue in
                            idCard = newValue.filter { $0.isNumber }
                        }
                }
                .frame(height: screenSize.scaleHeight(54))
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: screenSize.scaleHeight(8))
                        .stroke(Color.bodyTextColor.opacity(0.3), lineWidth: 1)
                        .background(Color.bodyTextColor.opacity(0.132))
                )
                .cornerRadius(8, corners: .allCorners)
                CSpace(height: screenSize.scaleHeight(16))
                HStack {
                    TextField("MM/YY", text: $expiryDateCard)
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                        .frame(width: screenSize.scaleWidth(160),height: screenSize.scaleHeight(54))
                        .padding(.leading, 10)
                        .foregroundStyle(Color.mainColor)
                        .tint(Color.myAccentColor)
                        .background(Color.bodyTextColor.opacity(0.132))
                        .cornerRadius(8, corners: .allCorners)
                        .keyboardType(.numberPad)
                        .onChange(of: expiryDateCard) { oldValue, newValue in
                            expiryDateCard = newValue.filter { $0.isNumber }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: screenSize.scaleHeight(8))
                                .stroke(Color.bodyTextColor.opacity(0.3), lineWidth: 1)
                        )
                    Spacer()
                    TextField("CVC", text: $cvcCard)
                        .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                        .frame(width: screenSize.scaleWidth(140),height: screenSize.scaleHeight(54))
                        .padding(.leading, 10)
                        .foregroundStyle(Color.mainColor)
                        .tint(Color.myAccentColor)
                        .background(Color.bodyTextColor.opacity(0.132))
                        .cornerRadius(8, corners: .allCorners)
                        .keyboardType(.numberPad)
                        .onChange(of: cvcCard) { oldValue, newValue in
                            cvcCard = newValue.filter { $0.isNumber }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: screenSize.scaleHeight(8))
                                .stroke(Color.bodyTextColor.opacity(0.3), lineWidth: 1)
                        )
                }
                .frame(height: screenSize.scaleHeight(54))
                .frame(maxWidth: .infinity, alignment: .leading)
                if keyboard.isKeyboardVisible {
                    CSpace(height: screenSize.scaleHeight(80))
                } else {
                    CSpace(height: screenSize.scaleHeight(300))
                }
                OrangeUIKitButton(titleButton: AppFood.String.addCardTitleButton, screenSize: screenSize, action: {
                    print("ADD CARD")
                })
                CSpace(height: screenSize.scaleHeight(16))
                Button(action: {
                    print("Scan Card")
                }, label: {
                    HStack {
                        Image(AppFood.StringImage.cameraIcon)
                        Text(AppFood.String.scanCardTitleButton)
                            .font(.yuGothicUISemibold(size: screenSize.scaleHeight(14)))
                            .foregroundStyle(Color.mainColor)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: screenSize.scaleHeight(48))
                    .overlay(
                        RoundedRectangle(cornerRadius: screenSize.scaleHeight(8))
                            .stroke(Color.bodyTextColor.opacity(0.3), lineWidth: 1)
                    )
                })
            }
        }
        .padding(.horizontal, screenSize.scaleWidth(20))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    router.goBack()
                }) {
                    Image(AppFood.StringImage.leftArrowBackIcon)
                        .foregroundColor(.blue)
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    PaymentMethodView()
}
