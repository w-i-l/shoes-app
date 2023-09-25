//
//  PaymentViewModel.swift
//  Shoes
//
//  Created by mishu on 25.09.2023.
//

import SwiftUI

class PaymentViewModel: BaseViewModel {
    @Published var creditCards: [CreditCardModel] = []
    @Published var holderName: String = " "
    @Published var creditCardNumber: String = " "
    @Published var expirationDate: Date = Date()
    let gradient: LinearGradient = gradients.randomElement()!
    
    override init() {
        super.init()
        
        PaymentService.shared.creditCards
            .receive(on: DispatchQueue.main)
            .sink { [weak self] creditCards in
                self?.creditCards = creditCards
            }
            .store(in: &self.bag)
        
        _holderName.projectedValue
            .receive(on: DispatchQueue.main)
            .sink { [weak self] holderName in
                self?.holderName = self!.filteredHolderName()
            }
            .store(in: &self.bag)
        
        _creditCardNumber.projectedValue
            .receive(on: DispatchQueue.main)
            .sink { [weak self] creditCardNumber in
                print(creditCardNumber)
                self?.creditCardNumber = self!.filteredCardNumber()
            }
            .store(in: &self.bag)
    }
    
    func setSelectedCreditCard(creditCard: CreditCardModel) {
        PaymentService.shared.setSelectedCreditCard(creditCard: creditCard)
    }
    
    func addCreditCard(creditCard: CreditCardModel) {
        PaymentService.shared.addCreditCard(creditCard: creditCard)
    }
    
    func filteredHolderName() -> String {
        holderName.trimmingCharacters(in: .newlines).filter { $0.isLetter || $0 == " "}
    }
    
    func insertSpacesEvery4kPlus3(string: String) -> String {
        var result = ""
        
        for (index, char) in string.enumerated() {
            
            result.append(char)
            
            if index % 4 == 3 && index != string.count - 1 {
                result.append(" ")
            }
        }
        
        return result
    }
    
    func filteredCardNumber() -> String {
        let filtered = creditCardNumber.trimmingCharacters(in: .whitespacesAndNewlines).filter { $0.isNumber }
        let maxDigits = String(filtered.prefix(16))
        return insertSpacesEvery4kPlus3(string: maxDigits)
    }
}
