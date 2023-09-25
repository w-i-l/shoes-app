//
//  CartViewModel.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import SwiftUI
import Combine

class CartViewModel: BaseViewModel {
    @Published var cartProducts: [Product: Int] = [:]
    
    var price: Double {
        return Double(cartProducts.reduce(into: 0) { partialResult, product in
            partialResult += product.key.price * product.value
        })
    }
    
    override init() {
        super.init()
        
        CartService.shared.cartProducts
            .receive(on: DispatchQueue.main)
            .sink { [weak self] cartProducts in
                self?.cartProducts = cartProducts
            }
            .store(in: &self.bag)
    }
    
    func clearCart() {
        CartService.shared.cartProducts.value = [:]
        self.cartProducts = [:]
    }
    
    func removeProduct(product: Product) {
        self.cartProducts[product] = nil
        CartService.shared.removeProduct(product: product)
    }
}
