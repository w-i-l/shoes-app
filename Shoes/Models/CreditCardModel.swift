//
//  CreditCardModel.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import SwiftUI

struct CreditCardModel {

    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd\\MM\\YYYY"
        return dateFormatter
    }

    let gradient: LinearGradient
    let cardNumber: String
    let name: String
    let expirationDate: Date
    
    init() {
        self.gradient = gradients.first!
        self.cardNumber = "1234-5678-0912-2343"
        self.name = "Placeholder Name"
        self.expirationDate = Date()
    }
    
    init(
        gradient: LinearGradient,
        cardNumber: String,
        name: String,
        expirationDate: Date
    ) {
        self.gradient = gradient
        self.cardNumber = cardNumber
        self.name = name
        self.expirationDate = expirationDate
    }
}
