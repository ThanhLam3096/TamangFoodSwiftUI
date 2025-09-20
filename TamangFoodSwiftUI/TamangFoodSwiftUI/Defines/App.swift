//
//  App.swift
//  TamangFoodSwiftUI
//
//  Created by Thanh Lâm on 17/6/25.
//

import Foundation

struct AppFood {
    struct Key { }
}

extension AppFood.Key { }

struct Google { }

struct Facebook { }

enum TypeList {
    case featurePartners
    case nation
}

enum TypeMeal {
    case nation
    case category
    
    var title: String {
        switch self {
        case .nation:
            return "National"
        case .category:
            return "Categories"
        }
    }
}

// MARK: -Enum
enum HeaderFilterType {
    case nationHeader
    case categoryHeader
    case priceRangeHeader
    
    var title: String {
        switch self {
        case .nationHeader:
            return "NATION"
        case .categoryHeader:
            return "CATEGORY"
        case .priceRangeHeader:
            return "PRICE RANGE"
        }
    }
}
