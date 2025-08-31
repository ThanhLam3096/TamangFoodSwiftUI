//
//  View.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 3/5/25.
//

import Foundation
import SwiftUI
import Shimmer

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
    
    func dismissView(_ presentationMode: Binding<PresentationMode>) {
            presentationMode.wrappedValue.dismiss()
        }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    let radius: CGFloat
    let corners: UIRectCorner

    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ShimmerModifier: ViewModifier {
    var config: ShimmerConfig
    var active: Bool
    
    @State private var move: CGFloat = -1
    
    func body(content: Content) -> some View {
        ZStack {
            // backgroup
            content
                .foregroundColor(config.tint)
            
            if active {
                // highlight move
                content
                    .mask(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                .clear,
                                config.highlight.opacity(config.highlightOpacity),
                                .clear
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .blur(radius: config.blur)
                        .offset(x: move * 300) // move speed gradient
                    )
                    .onAppear {
                        withAnimation(
                            Animation.linear(duration: config.speed)
                                .repeatForever(autoreverses: false)
                        ) {
                            move = 2
                        }
                    }
            }
        }
    }
}

extension View {
    func shimmering(config: ShimmerConfig, active: Bool = true) -> some View {
        self.modifier(ShimmerModifier(config: config, active: active))
    }
}
