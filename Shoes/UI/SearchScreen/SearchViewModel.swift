//
//  SearchViewModel.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import SwiftUI

enum SortingCriteria: String, CaseIterable {
    case priceLowHigh = "Price Low-High"
    case priceHighLow = "Price High-Low"
    case popularity = "Popularity"
    case newest = "Newest"
}

enum ProductCategories: String, CaseIterable, Codable {
    case all = "all"
    case running = "running"
    case lifestyle = "lifestyle"
    case gym = "gym"
    case basketball = "basketball"
    case skateboarding = "skateboarding"
}

class SearchViewModel: BaseViewModel {
    @Published var selectedCategory: ProductCategories = .all
    @Published var sortingCriteria: SortingCriteria = .priceLowHigh
    @Published var textSearched: String = ""
    @Published var shoesArray: [Product] = []
    
    var arrayToShow: [Product] {
        
        if !textSearched.isEmpty {
            // sorting using the text
            if !shoesArray.filter({$0.name.lowercased().starts(with: textSearched.lowercased())}).isEmpty {
                return shoesArray.filter{$0.name.lowercased().starts(with: textSearched.lowercased())}
            }
        } else {
            // sorting using criteria
            if selectedCategory == .all {
                
                if sortingCriteria == .priceLowHigh{
                    return shoesArray.sorted{$0.price < $1.price}
                } else if sortingCriteria == .priceHighLow {
                    return shoesArray.sorted{$0.price > $1.price}
                } else if sortingCriteria == .popularity {
                    return shoesArray.sorted{$0.rating > $1.rating}
                } else if sortingCriteria == .newest {
                    return shoesArray.sorted{$0.reviews > $1.reviews}
                }
            } else {
                return shoesArray.filter { selectedCategory.rawValue == $0.category.rawValue }
            }
        }
        
       return [Product]()
    }
    
    override init() {
        self.shoesArray = MockedAPI.shared.getAllProducts()
    }
}
