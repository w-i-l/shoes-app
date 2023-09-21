//
//  ProductModel.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import Foundation

enum Category: String, Codable {
    case running = "running"
    case basketball = "basketball"
    case lifestyle = "lifestyle"
    case gym = "gym"
    case skateboarding = "skateboarding"
}


struct Product: Identifiable, Hashable, Codable {
    
    var id: String {
        name + logo + subtitle
    }
    let name: String
    let price: Int
    let category: Category
    let logo: String
    let subtitle: String
    let imageArray: [String]
    let rating: Double
    let reviews: Int
    let description: String
    let sizes: [Int]
    
}
