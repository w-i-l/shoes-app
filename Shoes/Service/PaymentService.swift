//
//  PaymentService.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import SwiftUI
import Combine


class PaymentService {
    var creditCards: CurrentValueSubject<[CreditCardModel], Never> = .init([])
    private(set) var selectedCard: CurrentValueSubject<CreditCardModel, Never> = .init(CreditCardModel())
    
    static let shared = PaymentService()
    
    private init() {
        
    }
    
    func addCreditCard(creditCard: CreditCardModel) {
        self.creditCards.value.append(creditCard)
    }
    
    func setSelectedCreditCard(creditCard: CreditCardModel) {
        self.selectedCard.value = creditCard
    }
    
}
