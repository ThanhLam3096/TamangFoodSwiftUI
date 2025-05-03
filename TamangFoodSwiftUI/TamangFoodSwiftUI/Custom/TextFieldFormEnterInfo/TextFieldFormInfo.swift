//
//  TextFieldFormInfo.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 30/4/25.
//

import SwiftUI

struct TextFieldFormInfo: View {
    let title: String
    let screenSize: ScreenSize
    let isPasswordForm: Bool
    @ObservedObject var viewModel: TextFieldFormInfoViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.yuGothicUILight(size: screenSize.scaleHeight(12)))
                    .frame(alignment: .leading)
                Spacer()
                if isPasswordForm {
                    Button(action: {
                        if viewModel.isShowPassword {
                            viewModel.isShowPassword = false
                        } else {
                            viewModel.isShowPassword = true
                        }
                    }) {
                        Image(systemName:  viewModel.isShowPassword == true ? "eye" : "eye.slash.fill") // ảnh từ asset
                            .resizable()
                            .frame(width: screenSize.scaleWidth(14), height: screenSize.scaleHeight(12))
                            .foregroundStyle(Color.bodyTextColor)
                    }
                }
            }
            CSpace(height: screenSize.scaleHeight(8))
            HStack {
//                TextField("", text: $viewModel.infoUser)
//                    .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
//                    .foregroundStyle(Color.mainColor)
                textFieldView()
                
            }
            CSpace(height: screenSize.scaleHeight(10))
            Color(hex: "#F6F6F6")
                .frame(height: 1)
        }
    }
    
    @ViewBuilder
       private func textFieldView() -> some View {
           HStack {
               if isPasswordForm && viewModel.isSecureText {
                   SecureField("", text: $viewModel.infoUser)
                       .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                       .foregroundStyle(Color.mainColor)
                       .tint(Color.accentColor)
               } else {
                   TextField("", text: $viewModel.infoUser)
                       .font(.yuGothicUIRegular(size: screenSize.scaleHeight(16)))
                       .foregroundStyle(Color.mainColor)
                       .tint(Color.accentColor)
               }

               Image("check")
           }
       }
}

#Preview {
    TextFieldFormInfo(
        title: "Email",
        screenSize: ScreenSize(width: 375, height: 812),
        isPasswordForm: true,
        viewModel: TextFieldFormInfoViewModel()
    )
}
