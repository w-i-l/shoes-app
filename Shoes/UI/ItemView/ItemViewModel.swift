//
//  ItemViewModel.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import SwiftUI

class ItemViewModel: BaseViewModel {
    @Published var cartProducts: [Product: Int] = [:]
    
    override init() {
        
        super.init()
        
        CartService.shared.cartProducts
            .receive(on: DispatchQueue.main)
            .sink { [weak self] cartProducts in
                self?.cartProducts = cartProducts
            }
            .store(in: &self.bag)
    }
    
    func addProduct(product: Product) {
        CartService.shared.addProduct(product: product)
    }
    
    func removeProduct(product: Product) {
        CartService.shared.removeProduct(product: product)
    }
    
    func isProductInCart(productID: String) -> Bool {
        CartService.shared.isProductInCart(productID: productID)
    }
}
