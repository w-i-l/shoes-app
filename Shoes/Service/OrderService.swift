//
//  OrderService.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import SwiftUI
import Combine

class OrderService {
    
    var orders: CurrentValueSubject<[OrderModel], Never> = .init([])
    
    static let shared = OrderService()
    
    private init() {
        if let orders = UserDefaults.standard.object(forKey: "orders") as? [OrderModel] {
            self.orders.value = orders
        }
    }
    
    func addOrder(order: OrderModel) {
        self.orders.value.append(order)
    }
    
    func removeOrder(order: OrderModel) {
        self.orders.value.removeAll { $0 == order }
    }
}
