//
//  CheckoutViewModel.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import SwiftUI

class CheckoutViewModel: BaseViewModel {
    
    @Published var street: String = " "
    @Published var number: String = " "
    @Published var town: String = " "
    @Published var region: String = " "
    @Published var country: String = " "
    @Published var paymentMethod: PaymentMethod = .cash
    let cartProducts: [Product: Int]
    
    init(cartProducts: [Product: Int]) {
        
        self.cartProducts = cartProducts
    }
    
    func addOrder() {
        
        let order = OrderModel(
            street: street,
            number: number,
            town: town,
            region: region,
            country: country,
            paymentMethod: paymentMethod,
            cartItems: cartProducts
        )
        
        OrderService.shared.addOrder(order: order)
    }
    
    func getCartProducts() -> [Product: Int] {
        return cartProducts
    }
}
