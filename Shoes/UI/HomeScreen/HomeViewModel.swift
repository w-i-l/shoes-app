//
//  HomeViewModel.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var newArrivalsProducts: [Product] = []
    
    let numberOfColumnsForArrivalProducts: Int = 2
    let numberOfRowsForArrivalProducts: Int = 2
    
    init() {
        
        let numberOfArrivalProducts = numberOfRowsForArrivalProducts * numberOfColumnsForArrivalProducts
        self.newArrivalsProducts = MockedAPI.shared.getArrivalsProducts(numberOfElements: numberOfArrivalProducts)
    }
    
    func manageLikedProduct(product: Product) {
        if LikedService.shared.isProductLiked(productID: product.id) {
            LikedService.shared.removeLikedProduct(productID: product.id)
        } else {
            LikedService.shared.addLikedProduct(product: product)
        }
    }
    
    func isProductLiked(productID: UUID) -> Bool {
        return LikedService.shared.isProductLiked(productID: productID)
    }
}
