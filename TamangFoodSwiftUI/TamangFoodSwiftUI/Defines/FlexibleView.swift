//
//  FlexibleView.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 16/9/25.
//

import Foundation
import SwiftUI

// PreferenceKey để truyền size của từng child lên parent
private struct ChildSizePreferenceKey: PreferenceKey {
    static var defaultValue: [AnyHashable: CGSize] = [:]
    static func reduce(value: inout [AnyHashable : CGSize],
                       nextValue: () -> [AnyHashable : CGSize]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

/// FlexibleView: flow layout cho VStack/HStack wrap
struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    let horizontalSpacing: CGFloat
    let verticalSpacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    let screenSize: ScreenSize

    @State private var sizes: [AnyHashable: CGSize] = [:]
    @State private var rowCount: Int = 0 

    init(_ data: Data,
         horizontalSpacing: CGFloat = 12,
         verticalSpacing: CGFloat = 12,
         alignment: HorizontalAlignment = .leading,
         screenSize: ScreenSize,
         @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.alignment = alignment
        self.content = content
        self.screenSize = screenSize
    }

    var body: some View {
        // Thay vì GeometryReader -> dùng width của parent
        GeometryReader { geometry in
            let totalWidth = geometry.size.width
            VStack(alignment: alignment, spacing: verticalSpacing) {
                generateRows(in: totalWidth)
            }
            .frame(width: totalWidth, alignment: .leading)
        }
        // 👇 Thêm minHeight để tránh collapse
        .frame(minHeight: intrinsicHeight())
    }

    private func generateRows(in totalWidth: CGFloat) -> some View {
        var rows: [[Data.Element]] = [[]]
        var currentRowWidth: CGFloat = 0

        for element in data {
            let elementSize = sizes[AnyHashable(element)] ?? CGSize(width: 50, height: 1)
            let itemWidth = elementSize.width

            if currentRowWidth + itemWidth + horizontalSpacing > totalWidth {
                rows.append([element])
                currentRowWidth = itemWidth + horizontalSpacing
            } else {
                rows[rows.count - 1].append(element)
                currentRowWidth += itemWidth + horizontalSpacing
            }
        }

        return ForEach(rows.indices, id: \.self) { rowIndex in
            HStack(spacing: horizontalSpacing) {
                ForEach(rows[rowIndex], id: \.self) { element in
                    content(element)
                        .fixedSize()
                        .background(
                            GeometryReader { proxy in
                                Color.clear
                                    .preference(key: ChildSizePreferenceKey.self,
                                                value: [AnyHashable(element): proxy.size])
                            }
                        )
                }
            }
        }
        .onPreferenceChange(ChildSizePreferenceKey.self) { prefs in
            sizes.merge(prefs, uniquingKeysWith: { $1 })
        }
    }

    /// Tính chiều cao tạm cho container (tránh height=0)
    private func intrinsicHeight() -> CGFloat {
        let total = sizes.values.map { $0.height }.reduce(0, +)
        return total > 0 ? total - screenSize.scaleHeight(130) : 200
    }
}

//import SwiftUI
//
//// PreferenceKey để truyền size của từng child lên parent
//private struct ChildSizePreferenceKey: PreferenceKey {
//    static var defaultValue: [AnyHashable: CGSize] = [:]
//    static func reduce(value: inout [AnyHashable : CGSize],
//                       nextValue: () -> [AnyHashable : CGSize]) {
//        value.merge(nextValue(), uniquingKeysWith: { $1 })
//    }
//}
//
///// FlexibleView: flow layout cho VStack/HStack wrap
//struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
//    let data: Data
//    let horizontalSpacing: CGFloat
//    let verticalSpacing: CGFloat
//    let alignment: HorizontalAlignment
//    let content: (Data.Element) -> Content
//    let screenSize: ScreenSize
//
//    @State private var sizes: [AnyHashable: CGSize] = [:]
//    @State private var rowCount: Int = 0   // 👈 số row
//
//    init(_ data: Data,
//         horizontalSpacing: CGFloat = 12,
//         verticalSpacing: CGFloat = 12,
//         alignment: HorizontalAlignment = .leading,
//         screenSize: ScreenSize,
//         @ViewBuilder content: @escaping (Data.Element) -> Content) {
//        self.data = data
//        self.horizontalSpacing = horizontalSpacing
//        self.verticalSpacing = verticalSpacing
//        self.alignment = alignment
//        self.content = content
//        self.screenSize = screenSize
//    }
//
//    var body: some View {
//        GeometryReader { geometry in
//            let totalWidth = geometry.size.width
//            let rows = calculateRows(in: totalWidth)
//
//            VStack(alignment: alignment, spacing: verticalSpacing) {
//                ForEach(rows.indices, id: \.self) { rowIndex in
//                    HStack(spacing: horizontalSpacing) {
//                        ForEach(rows[rowIndex], id: \.self) { element in
//                            content(element)
//                                .fixedSize()
//                                .background(
//                                    GeometryReader { proxy in
//                                        Color.clear.preference(
//                                            key: ChildSizePreferenceKey.self,
//                                            value: [AnyHashable(element): proxy.size]
//                                        )
//                                    }
//                                )
//                        }
//                    }
//                }
//            }
//            .onAppear {
//                rowCount = rows.count   // 👈 cập nhật số row
//                print("Row count = \(rowCount)")
//            }
//            .onChange(of: sizes) { oldValue, newValue in
//                rowCount = calculateRows(in: totalWidth).count
//                print("Row count = \(rowCount)")
//            }
//            .onPreferenceChange(ChildSizePreferenceKey.self) { prefs in
//                sizes.merge(prefs, uniquingKeysWith: { $1 })
//            }
//            .frame(width: totalWidth, alignment: .leading)
//        }
//        .frame(minHeight: intrinsicHeight())
//    }
//
//    private func calculateRows(in totalWidth: CGFloat) -> [[Data.Element]] {
//        var rows: [[Data.Element]] = [[]]
//        var currentRowWidth: CGFloat = 0
//
//        for element in data {
//            let elementSize = sizes[AnyHashable(element)] ?? CGSize(width: 50, height: 30)
//            let itemWidth = elementSize.width
//
//            if currentRowWidth + itemWidth + horizontalSpacing > totalWidth {
//                rows.append([element])
//                currentRowWidth = itemWidth + horizontalSpacing
//            } else {
//                rows[rows.count - 1].append(element)
//                currentRowWidth += itemWidth + horizontalSpacing
//            }
//        }
//        return rows
//    }
//
//    private func intrinsicHeight() -> CGFloat {
//        let totalHeight = calculateRows(in: screenSize.width).map { row in
//            row.compactMap { sizes[AnyHashable($0)]?.height }.max() ?? 0
//        }.reduce(0, +)
//
//        let spacingTotal = verticalSpacing * CGFloat(max(rowCount - 1, 0))
////        return totalHeight + spacingTotal
//        return CGFloat(CGFloat(rowCount + 1) * screenSize.scaleHeight(40))
//    }
//}
