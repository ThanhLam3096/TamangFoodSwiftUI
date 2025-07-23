//
//  API.swift
//  FoodSwift
//
//  Created by Thanh Lâm on 15/10/24.
//

import Foundation

enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error."
        }
    }
}

final class Api {
    struct Path {
        static let pathURL = "https://www.themealdb.com/api/json/v1/1/"
        static let apiListCategory = "\(pathURL)categories.php"
        static let apiMealCategoryAndArea = "\(pathURL)filter.php?"
        static let apiListArea = "\(pathURL)list.php?a=list"
        static let apiDetailMeal = "\(pathURL)lookup.php?"
        static let apiRandomMeal = "\(pathURL)random.php"
        static let apiSearchFirstLetter = "\(pathURL)search.php?f="
        static let apiSearchByName = "\(pathURL)search.php?s="
        static let apiCategory = "\(pathURL)list.php?c=list"
        static let apiFeaturedParners = "https://script.googleusercontent.com/macros/echo?user_content_key=AehSKLi-wuUOck-7IJKZID7RdzPKcUx3DzWPqpBgmWx7xUd_ZU5dF_szvhzov7g86hepgso85XD0tyny2ns4hoElB3O4yYXI30iayq0BnQu6FDI5itj-9R8B6CIFHCNtzRozzpJK58AyVGsApU8ZgmM5tWnjwMfFwfK1c8l3PMXbfmLS5kQ-8-dSRG6IwK2gQNeXWJ35NBMnQ609R65cfDxbxv8yFtOf27jLv75rmAueW1jkTa0Sy3loo1YKwunHKeBcZ9k4JTdJx4doP9OqDbhU3bpR9Vxk0gUpq0KoOA5o&lib=MGkmMVj97Ih2t4r2Gme6j89nrfDW60jj6"
        static let apiNationFoodVietNam = "https://script.googleusercontent.com/macros/echo?user_content_key=AehSKLiysmGDbz8JAWnXYKpQa3t24aAZsL-PxI_8uq6LShUruiw_qJ5k_2jxJl_DLbaiP2xkZt7NqRvtQU-YKP-ID-xuq2UOsUT1Gpx2GUavhyw-EV75pkVX6UQ7tMt9Fmay899dyLOp8I7IHis9hYmTpmzkQcYDqLghpwwty4qJE1QLN6-KmRSt4lynqUQT9nrcpCaaKohzfKNPwRlRf1H0q6unORhIIWlUUMgSc5WITIDEaK5_hy8PI5kGLDLH6L_nPCGRVWRcqVcSC6i5GaD19_CGwo-l12b35hfFUqmO&lib=MGkmMVj97Ih2t4r2Gme6j89nrfDW60jj6"
        static let apiListRestaurant = "https://script.googleusercontent.com/macros/echo?user_content_key=AehSKLiAxI5V6fCwqTDZBLLSokDoHHRfFkP_Uf4psVGEXABMW0SEX6OA57-ToKunrJN98jcVFhS67IRPmGJQta1ZwGcTOr92hBh-Iuf6sQmOLVlhJ3o0LkpAGSaVwoO7mwLUBnaSiUnfP0e5hMBRragvj2hPm5R_W8CQ5l04ZeL3kdgcSMc8K8czBs3y5xOyXVNbfolTVXk3zn0W6yVWiNgR2RwmLGOx7-FypWUKebIUad8Lp8B2VUEPAcJ7-r-RxNZxXYF9yYTO8V8nvtpQTeFtE9fEaODHip-nBv9k9y5h&lib=MGkmMVj97Ih2t4r2Gme6j89nrfDW60jj6"
    }
}
