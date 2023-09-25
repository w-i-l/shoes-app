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

struct Shadow: ViewModifier {
    
    let color: Color
    let cornerRadius: CGFloat
    let intensity = 0.05
    let lightIntensity = 0.1
    func body(content: Content) -> some View {
        
        content
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
 
struct Inner: ViewModifier {
    let color: Color
    let cornerRadius: CGFloat
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
