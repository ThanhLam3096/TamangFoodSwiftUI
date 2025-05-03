//
//  TextFieldFormInfoViewModel.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 2/5/25.
//

import Foundation
import SwiftUI

final class TextFieldFormInfoViewModel: ObservableObject {
    @Published var infoUser: String = ""
    @Published var isSecureText: Bool = true 
    @Published var isShowPassword: Bool = false
    
    init(infoUser: String = "") {
           self.infoUser = infoUser
       }
}
