//
//  SocialType.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 3/5/25.
//

import Foundation
import SwiftUI

enum SocialAccountType: String {
    case facebook = "facebook"
    case google = "google"
    
    var title: String {
        switch self {
        case .facebook:
            return "CONNECT WITH FACEBOOK"
        case .google:
            return "CONNECT WITH GOOGLE"
        }
    }
    
    var color: Color {
        switch self {
        case .facebook:
            return Color(hex: "#395998")
        case .google:
            return Color(hex: "#4285F4")
        }
    }
}
