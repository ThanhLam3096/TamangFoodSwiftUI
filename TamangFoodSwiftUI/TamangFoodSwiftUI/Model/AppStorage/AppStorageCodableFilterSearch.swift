//
//  AppStorageCodableFilterSearch.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 5/10/25.
//

import Foundation
import SwiftUI

@propertyWrapper
struct AppStorageCodableFilterSearch<Value: Codable>: DynamicProperty {
    private let key: String
    private let defaultValue: Value
    @AppStorage private var storedData: Data

    init(_ key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
        self._storedData = AppStorage(wrappedValue: Data(), key)
    }

    var wrappedValue: Value {
        get {
            guard !storedData.isEmpty else { return defaultValue }
            return (try? JSONDecoder().decode(Value.self, from: storedData)) ?? defaultValue
        }
        set {
            storedData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }
}
