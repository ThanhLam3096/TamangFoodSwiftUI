//
//  FlexibleWrapView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 20/9/25.
//

import SwiftUI

struct FlexibleWrapView: View {
    
    // MARK: - Properties
    let screenSize: ScreenSize
    @ObservedObject var viewModel: FlexibleWrapViewModel
    
    // MARK: Action
    let action: (String) -> Void

    @State private var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStack


    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.viewModel.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding(.trailing, viewModel.horizontalSpacing)
                    .padding(.vertical, viewModel.verticalSpacing)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.viewModel.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.viewModel.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        Button(action: {
            action(text)
        }, label: {
            Text(text)
                .font(.yuGothicUISemibold(size: screenSize.scaleHeight(14)))
                .foregroundStyle(viewModel.listFilterChoice.contains(text) ? Color.bgColor :Color.bodyTextColor)
                .padding(.horizontal, 20)
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(viewModel.listFilterChoice.contains(text) ? Color.myAccentColor : Color.init(hex: "F1F1F1"))
                        .frame(height: screenSize.scaleHeight(40))
                )
        })
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct TestFlexibleWrapView : View {
    var body: some View {
        VStack {
            FlexibleWrapView(screenSize: ScreenSize(width: 375, height: 817), viewModel: FlexibleWrapViewModel(tags: ["USA", "British", "Canadian", "China", "Croatian", "Dutch", "Egyptian", "Filipino", "France", "Greek", "Indian", "Irish", "Italian", "Jamaican", "Japan", "Kenyan", "Malaysian", "Mexican", "Moroccan", "Polish", "Portuguese", "Russia", "Spanish", "Thai", "Tunisian", "Turkish", "Ukrainian", "Uruguay", "VietNam"], horizontalSpacing: 10, verticalSpacing: 20, paddingText: 10, listFilterChoice: []), action: {_ in })
            Divider()
            FlexibleWrapView(screenSize: ScreenSize(width: 375, height: 817),viewModel: FlexibleWrapViewModel(tags: ["Apple", "Google", "Amazon", "Microsoft", "Oracle", "Facebook"], horizontalSpacing: 10, verticalSpacing: 20, paddingText: 10, listFilterChoice: []), action: {_ in })
        }
    }
}

#Preview {
    TestFlexibleWrapView()
}
