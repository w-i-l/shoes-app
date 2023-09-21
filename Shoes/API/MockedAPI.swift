//
//  MockedAPI.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import Foundation
import Combine

class MockedAPI {
    static let shared = MockedAPI()

    private init() {}
    
    func getAllProducts() -> [Product] {
        return MockedData.shoesArray
    }
}
