//
//  CreditCardView.swift
//  Tesla
//
//  Created by mishu on 09.08.2022.
//

import SwiftUI

struct CreditCardView: View {
    
    let creditCardModel: CreditCardModel
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(creditCardModel.gradient)
                .aspectRatio(1.73, contentMode: .fill)
                .frame(width: min(UIScreen.main.bounds.width / 1.2, 315), height: min(UIScreen.main.bounds.height / 4.5, 190))
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Image((creditCardModel.cardNumber.first ?? "0").asciiValue! % 2 == 0 ? "mastercard" : "visa")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 9, height: UIScreen.main.bounds.width / 12)
                }
                .padding(.top,10)
                .padding(.horizontal)
                .padding(.bottom,30)
                
                Text(creditCardModel.cardNumber)
                    .foregroundColor(white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                HStack {
                    
                    Text(creditCardModel.name)
                        .foregroundColor(white)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding()
                    
                    Spacer()
                    
                    Text(CreditCardModel.dateFormatter.string(from: creditCardModel.expirationDate))
                        .foregroundColor(white)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .padding()
                }
            }
            
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 4.5)
    }
}

extension CreditCardView: Equatable, Hashable {
    
    static func == (lhs: CreditCardView, rhs: CreditCardView) -> Bool {
        lhs.creditCardModel.cardNumber == rhs.creditCardModel.cardNumber
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(creditCardModel.cardNumber)
    }

}

struct PCreditCard_Personal: PreviewProvider {
    static var previews: some View {
        CreditCardView(creditCardModel: CreditCardModel())
    }
}
