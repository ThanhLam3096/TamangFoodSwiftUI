//
//  ScreenSize.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 8/4/25.
//

import Foundation
import SwiftUI

struct ScreenSize {
    var width: CGFloat
    var height: CGFloat
    
    init(width: CGFloat, height: CGFloat) {
            self.width = width
            self.height = height
        }

        init(from size: CGSize) {
            self.width = size.width
            self.height = size.height
        }

    func scaleWidth(_ value: CGFloat) -> CGFloat {
        value * (width / 375)
    }
    
    func scaleHeight(_ value: CGFloat) -> CGFloat {
        value * (height / 812)
    }
}

struct ScreenSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var screenSize: CGSize {
        get { self[ScreenSizeKey.self] }
        set { self[ScreenSizeKey.self] = newValue }
    }
}

struct CaptureScreenSize: ViewModifier {
    @State private var captured = false
    @Environment(\.screenSize) private var currentSize
    let setSize: (CGSize) -> Void
    
    func body(content: Content) -> some View {
        GeometryReader { proxy in
            content
                .onAppear {
                    if !captured {
                        captured = true
                        setSize(proxy.size)
                    }
                }
        }
    }
}

class ScreenSizeManager: ObservableObject {
    @Published var screenSize: CGSize = .zero
    
    func updateScreenSize(size: CGSize) {
        self.screenSize = size
    }
}

