//
//  View.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 3/5/25.
//

import Foundation
import SwiftUI
import Shimmer
import SwiftUIIntrospect

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

extension View {
    @MainActor func customScrollIndicator(color: UIColor, width: CGFloat = 3) -> some View {
        self.introspect(.scrollView, on: .iOS(.v15, .v16, .v17)) { scrollView in
            scrollView.showsVerticalScrollIndicator = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if let indicator = scrollView.subviews.first(where: {
                    String(describing: type(of: $0)).contains("Indicator")
                }) {
                    indicator.backgroundColor = color
                    indicator.layer.cornerRadius = width / 2
                    indicator.frame.size.width = width
                    indicator.clipsToBounds = true
                }
            }
        }
    }
}

extension View {
    @ViewBuilder
    func hidden(_ shouldHide: Bool) -> some View {
        if shouldHide {
            self.hidden()
        } else {
            self
        }
    }
}

struct CustomTextField: UIViewRepresentable {
    @Binding var text: String
    var onFirstTap: (() -> Void)?

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField
        var didFirstTap = false

        init(_ parent: CustomTextField) {
            self.parent = parent
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            if !didFirstTap {
                didFirstTap = true
                parent.onFirstTap?()
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.borderStyle = .roundedRect
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content
    
    init(_ value: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: value)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}

