//
//  ProductModel.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import Foundation



struct Product: Identifiable, Hashable, Codable {
    
    var id: String {
        name + logo + subtitle
    }
    let name: String
    let price: Int
    let category: ProductCategories
    let logo: String
    let subtitle: String
    let imageArray: [String]
    let rating: Double
    let reviews: Int
    let description: String
    let sizes: [Int]
    
}
