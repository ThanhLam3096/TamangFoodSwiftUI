//
//  TextWidth.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 4/5/25.
//

import Foundation
import SwiftUI

class TextWidthViewModel: ObservableObject {
    @Published var textWidth: CGFloat = 0
    
    func measureTextWidth(text: String, font: Font) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        
        let size = (text as NSString).size(withAttributes: attributes)
        return size.width
    }
}


struct TextWidthReader: UIViewRepresentable {
    var text: String
    var font: UIFont
    @Binding var textWidth: CGFloat

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0 // Cho phép nhiều dòng
        label.font = font
        label.text = text
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.font = font
        uiView.sizeToFit()
        uiView.layoutIfNeeded()
        
        let width = uiView.intrinsicContentSize.width
        // Cập nhật chiều rộng văn bản khi label thay đổi
        DispatchQueue.main.async {
            self.textWidth = width
        }
        print("===> TExt === \(text)")
        print("===> \(textWidth)")
    }
}
