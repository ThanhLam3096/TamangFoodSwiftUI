//
//  AnimatedImage.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 9/9/25.
//

import Foundation
import SwiftUI

struct AnimatedImage: View {
    let imageName: String
    let size: CGFloat
    
    @State private var animate = false
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: size, height: size)
            .opacity(animate ? 1 : 0) // fade in
            .rotation3DEffect(
                .degrees(animate ? 0 : 180),
                axis: (x: 0, y: 1, z: 2) // cỉrcle 3D
            )
            .scaleEffect(animate ? 1 : 0.5) // zoom scale
            .animation(.easeOut(duration: 1.5), value: animate)
            .task {
                animate = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    animate = true
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: .replayAnimation)) { notification in
                if let name = notification.object as? String, name == imageName {
                    // reset animation
                    animate = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        animate = true
                    }
                }
            }
    }
}

extension Notification.Name {
    static let replayAnimation = Notification.Name("ReplayAnimation")
}
