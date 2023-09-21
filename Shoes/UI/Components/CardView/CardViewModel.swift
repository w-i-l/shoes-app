//
//  CardViewModel.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import SwiftUI

class CardViewModel: BaseViewModel {
    
    static let shared = CardViewModel()
    
    @Published var likedProducts: [Product] = []
    
    private override init() {
        
        super.init()
        
        LikedService.shared.likedProducts
            .receive(on: DispatchQueue.main)
            .sink { [weak self] likedProducts in
                self?.likedProducts = likedProducts
            }
            .store(in: &self.bag)
    }
    
    func isProductLiked(productID: UUID) -> Bool {
        LikedService.shared.isProductLiked(productID: productID)
    }
    
    func manageLikedProduct(product: Product) {
        if LikedService.shared.isProductLiked(productID: product.id) {
            LikedService.shared.removeLikedProduct(productID: product.id)
        } else {
            LikedService.shared.addLikedProduct(product: product)
        }
    }
    
    func hideTabBar() {
        AppService.shared.showTabBar.value = false
    }
}
