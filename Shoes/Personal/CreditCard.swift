//
//  CreditCard.swift
//  Tesla
//
//  Created by mishu on 09.08.2022.
//

import SwiftUI

struct CreditCard: View, Equatable, Hashable {
    
    static func == (lhs: CreditCard, rhs: CreditCard) -> Bool {
        lhs.cardNumber == rhs.cardNumber
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(cardNumber)
    }

    @ObservedObject var value: NumbersOnly = NumbersOnly()
    @EnvironmentObject var showMenu: Storage
    
    let gradient: LinearGradient
    let cardNumber: String
    let name: String
    let expirationDate: String
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(gradient)
                .aspectRatio(1.73, contentMode: .fill)
                .frame(width: min(UIScreen.main.bounds.width / 1.2, 315), height: min(UIScreen.main.bounds.height / 4.5, 190))
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Image((cardNumber.first ?? "0").asciiValue! % 2 == 0 ? "mastercard" : "visa")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 9, height: UIScreen.main.bounds.width / 12)
                }
                .padding(.top,10)
                .padding(.horizontal)
                .padding(.bottom,30)
                
                Text(cardNumber)
                    .foregroundColor(white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                HStack {
                    
                    Text(name)
                        .foregroundColor(white)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding()
                    
                    Spacer()
                    
                    Text(expirationDate)
                        .foregroundColor(white)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .padding()
                    
                }
            }
            
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 4.5)
    }
    
    func width() -> Double {
        return min(UIScreen.main.bounds.width / 1.2, 315)
    }
    func height() -> Double {
        min(UIScreen.main.bounds.height / 4.5, 190)
    }
    
    init( _ gradient:LinearGradient = gradients[1], _ cardNumber:String = "5482 4548 4521 4526", _ name:String = "Peter J. Parkinson", _ expirationDate:String = "07/25"){
        
        //card number format
        var index = 0
        var numberCard = ""
        for i in cardNumber{
            
            numberCard += String(i)
            
            if index%5 == 3 && cardNumber[String.Index(encodedOffset: index+1 < cardNumber.count ? index+1 : 0) ] != " "{
                numberCard += " "
                index += 1
            }
            
            index += 1
        }
        
        self.cardNumber = numberCard
        
        //date format
        index = 0
        numberCard = ""
        for i in expirationDate{
            
            numberCard += String(i)
            
            if index%2 == 1 && expirationDate[String.Index(encodedOffset: index+1 < expirationDate.count ? index+1 : 0)] != "/" && index != 0 && index < 3{
                numberCard += "/"
//                index += 1
            }
            index += 1
        }
        
        self.gradient = gradient
        
        self.name = name
        self.expirationDate = numberCard
    }
}

struct PCreditCard_Personal: PreviewProvider {
    static var previews: some View {
        CreditCard()
    }
}
