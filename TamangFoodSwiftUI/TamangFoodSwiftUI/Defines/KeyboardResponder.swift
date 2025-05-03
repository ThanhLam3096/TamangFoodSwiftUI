//
//  KeyboardResponder.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 3/5/25.
//

import Foundation
import SwiftUI
import Combine

final class KeyboardResponder: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
//    @Published var isKeyboardVisible: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
//    private var cancellables = Set<AnyCancellable>()
    
    init() {
        let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)

        willShow
            .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect }
            .map { $0.height }
            .sink { [weak self] height in
                self?.keyboardHeight = height
            }
            .store(in: &cancellableSet)

        willHide
            .map { _ in CGFloat(0) }
            .sink { [weak self] _ in
                self?.keyboardHeight = 0
            }
            .store(in: &cancellableSet)
        
//        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
//            .sink { [weak self] _ in
//                self?.isKeyboardVisible = true
//            }
//            .store(in: &cancellables)
//        
//        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
//            .sink { [weak self] _ in
//                self?.isKeyboardVisible = false
//            }
//            .store(in: &cancellables)
    }
}
