//
//  ScreenSize.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 8/4/25.
//

import Foundation
import SwiftUI
import UIKit

struct ScreenSizeUIKit {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    static let shared = ScreenSizeUIKit()
    
    // Base size scale follow (iPhone 11: 375x812)
    private let baseWidth: CGFloat = 375
    private let baseHeight: CGFloat = 812
    
    private init() {
        let size = UIScreen.main.bounds.size
        self.screenWidth = size.width
        self.screenHeight = size.height
    }
    
    init(from size: CGSize) {
        self.screenWidth = size.width
        self.screenHeight = size.height
    }
    
    func scaleWidth(_ width: CGFloat) -> CGFloat {
        return width * (screenWidth / baseWidth)
    }
    
    func scaleHeight(_ height: CGFloat) -> CGFloat {
        return height * (screenHeight / baseHeight)
    }
}

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

extension CGFloat {
    var w: CGFloat {
        return ScreenSizeUIKit.shared.scaleWidth(self)
    }
    
    var h: CGFloat {
        return ScreenSizeUIKit.shared.scaleHeight(self)
    }
}
