//
//  SignInViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 4/5/25.
//

import Foundation

import SwiftUI

final class SignInViewModel: ObservableObject {
    @Published var moveToForgotPassword = false
    @Published var moveToCreateAccount = false
    @Published var moveToHome = false
    
    func moveToScreenForgotPassword() {
        moveToForgotPassword = true
    }
    
    func moveToScreenCreateAccount() {
        moveToCreateAccount = true
    }
    
    func moveToScreenHome() {
        moveToHome = true
    }
}
