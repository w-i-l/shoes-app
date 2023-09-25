//
//  OrderModel.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import Foundation

enum PaymentMethod: String, CaseIterable {
    case cash = "cash"
    case card = "card"
}

// TODO : From checkout -- change with model
struct OrderModel {
    let street: String
    let number: String
    let town: String
    let region: String
    let country: String
    let paymentMethod: PaymentMethod
    let cartItems: [Product: Int]
    
    init(
        street: String,
        number: String,
        town: String,
        region: String,
        country: String,
        paymentMethod: PaymentMethod,
        cartItems: [Product: Int]
    ) {
        self.street = street
        self.number = number
        self.town = town
        self.region = region
        self.country = country
        self.paymentMethod = paymentMethod
        self.cartItems = cartItems
    }
    
    init() {
        self.street = "unkown"
        self.number = "unkown"
        self.town = "unkown"
        self.region = "unkown"
        self.country = "unkown"
        self.paymentMethod = .cash
        self.cartItems = [:]
    }
}

extension OrderModel: Equatable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(street + number + town + region + country + paymentMethod.rawValue)
    }
}

extension OrderModel: Identifiable {
    var id: String {
        return street + number + town + region + country + paymentMethod.rawValue + (cartItems.first?.key.name)! + String(cartItems.first!.value)
    }
}
