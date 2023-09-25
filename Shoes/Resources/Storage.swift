//
//  Storage.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI
// sa fac sa dispara meniul
class Storage:ObservableObject{
    @Published var currentPage = "house"
    @Published var showMenu = true
//    @Published var cart:Set<Product> = Set<Product>()
    @Published var cart:Dictionary<Product,Int> = Dictionary<Product,Int>()
    @Published var liked:[Product] = Array<Product>(){
        // LOADING DATEA FROM USERDEFAULTS
        didSet{
            if let encoded =  try? JSONEncoder().encode(liked){
                UserDefaults.standard.set(encoded, forKey: "Liked")
            }
        }
    }
    @Published var purchased:Array<(Dictionary<Product,Int>,[String])> = Array<(Dictionary<Product,Int>,Array<String>)>()
    @Published var creditCards:[CreditCardView] = [CreditCardView(creditCardModel: CreditCardModel()),CreditCardView(creditCardModel: CreditCardModel())]
    @Published var selectedCard:CreditCardView = CreditCardView(creditCardModel: CreditCardModel())
    
    init(){
        
        //IF WE DON T HAVE ANY LIKED ITEMS SAVED
        if  let likedItems = UserDefaults.standard.object(forKey: "Liked"){
            if let decoded = try? JSONDecoder().decode(Array<Product>.self, from: likedItems as! Data){
                liked = decoded
                return
            }
        }
        
        liked = []
    }
    
}



class NumbersOnly: ObservableObject {
    @Published var cardNumber = " " {
        didSet {
            
            
            let filtered = cardNumber.filter { $0.isNumber }
            
            if cardNumber != filtered && cardNumber.count <= 16 {
                cardNumber = filtered
            }
            else if cardNumber.count > 16{
                cardNumber = String(filtered.prefix(16))
                

            }
        }
    }
        
    
    @Published var expirationDate = " " {
        didSet {
            let filtered = expirationDate.filter { $0.isNumber }
            
            if expirationDate != filtered  && expirationDate.count <= 4{
                expirationDate = filtered
            }
            else if expirationDate.count > 4{
                expirationDate = String(filtered.prefix(4))
            }
            
            
        }
    }
    
    @Published var holderName = " " {
        didSet {
           
            let filtered = holderName.filter {$0.isLetter || $0 == " "}
            
            if holderName != filtered {
                holderName = filtered
            }
            
            
        }
    }
}


struct Shadow:ViewModifier{
    let color:Color
    let cornerRadius:CGFloat
    let intensity = 0.05
    let lightIntensity = 0.1
    func body(content: Content) -> some View {
        content
//            .shadow(color: Color(red: UIColor(color).cgColor.components![0]-intensity , green: UIColor(color).cgColor.components![1]-intensity , blue: UIColor(color).cgColor.components![2]-intensity), radius: 4, x: 6, y: 6)
//            .shadow(color: Color(red: UIColor(color).cgColor.components![0]+lightIntensity , green: UIColor(color).cgColor.components![1]+lightIntensity , blue: UIColor(color).cgColor.components![2]+lightIntensity), radius: 4, x: -6, y: -6)
            .shadow(color: .white, radius: 5, x: -5, y: -5)
            .shadow(color: .gray, radius: 3, x: 5, y: 5)
            .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(color,lineWidth: 4)
                        .shadow(color: dark_color, radius: 5, x: 5, y: 5)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: white, radius: 5, x: -5, y: -5)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                )

    }
    init(color: Color = .white,cornerRadius:CGFloat = 20){
        self.color = color
        self.cornerRadius = cornerRadius
    }
}

struct Inner:ViewModifier{
    let color:Color
    let cornerRadius:CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(color,lineWidth: 4)
                        .shadow(color: dark_color, radius: 4, x: -3, y: -3)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: white, radius: 2, x: 1, y: 1)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                )
    }
}

extension View{
    func innerOuterShadow(color:Color,cornerRadius:CGFloat = 20) -> some View{
        modifier(Shadow(color: color,cornerRadius: cornerRadius))
    }
    func innerShadow(color:Color,cornerRadius:CGFloat = 20) -> some View{
        modifier(Inner(color: color, cornerRadius: cornerRadius))
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
