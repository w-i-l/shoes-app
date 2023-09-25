//
//  CartServicer.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import Foundation
import Combine

class CartService {
    
    var cartProducts: CurrentValueSubject<[Product: Int], Never> = .init([:])
    
    static let shared = CartService()
    
    private init() {
        
    }
    
    func addProduct(product: Product) {
        if self.cartProducts.value.keys.first(where: { $0.id == product.id }) != nil {
            self.cartProducts.value[product]! += 1
        } else {
            self.cartProducts.value[product] = 1
        }
    }
    
    func removeProduct(product: Product) {
        if self.cartProducts.value.keys.map({ $0.id }).contains(product.id) {
            if self.cartProducts.value[product]! > 1 {
                self.cartProducts.value[product]! -= 1
            } else {
                self.cartProducts.value[product] = nil
            }
        }
    }
    
    func isProductInCart(productID: String) -> Bool {
        return self.cartProducts.value.keys.map { $0.id }.first { $0 == productID } != nil
    }
}
