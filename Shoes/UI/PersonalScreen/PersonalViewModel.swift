//
//  PersonalViewModel.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import SwiftUI

class PersonalViewModel: BaseViewModel {
    @Published var orders: [OrderModel] = []
    @Published var selectedCard: CreditCardModel = CreditCardModel()
    
    override init() {
        super.init()
        
        OrderService.shared.orders
            .receive(on: DispatchQueue.main)
            .sink { [weak self] orders in
                self?.orders = orders
            }
            .store(in: &self.bag)
    }
}
