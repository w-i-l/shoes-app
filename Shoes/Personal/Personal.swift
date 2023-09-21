//
//  Personal.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct Personal:View{
    
    @EnvironmentObject var showMenu:Storage
    
//    @State var selectedCard = CreditCard()
    @State var ofsett:CGFloat = .zero
    @State var distance:CGFloat = .zero
    
    let cardWidth = CreditCard().width()
    
    var body: some View{
        NavigationView {
            ZStack{
                
                background_color.ignoresSafeArea()
                
                VStack{
                    //slide cards
//                        HStack {
//                            ForEach(showMenu.creditCards,id:\.self.cardNumber){elem in
//                                elem
//
//
//                            }
//
////                            Spacer()
//                        }
//                        .offset(x:ofsett+distance)
//                        .offset(x:Double(showMenu.creditCards.firstIndex(of: selectedCard)! > Int(showMenu.creditCards.count/2) ? -showMenu.creditCards.firstIndex(of: selectedCard)!+Int(showMenu.creditCards.count/2) : -showMenu.creditCards.firstIndex(of: selectedCard)!+Int(showMenu.creditCards.count/2))*CreditCard().width()+10)
//                        .gesture(
//                            DragGesture()
//                                .onChanged{translation in
//                                    withAnimation(.interactiveSpring()){
////                                        distance = (translation.width >= 0 ? 1 : -1 ) * max(translation.translation.width * 1.4, cardWidth/2)
//                                        distance = translation.translation.width
//                                    }
//                                }
//                                .onEnded({ value in
//
//                                    withAnimation(.spring()){
////                                        ofsett += value.translation.width * 1.4
//                                        ofsett += value.translation.width > 0 ? (cardWidth + 10) : -(cardWidth + 10)
//                                        distance = .zero
////                                        selectedCard = value.translation.width > 0 ? creditCards[creditCards.index(after:creditCards.firstIndex(of: selectedCard)!)] : creditCards[0]
//                                    }
//
//
//                                })
//                        )
                    
                    showMenu.selectedCard
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .fill(background_color)
                            .overlay(RoundedRectangle(cornerRadius: 50).trim(from: 0.5, to: 1).stroke(gray1,lineWidth: 2))
                            
                            
                        VStack(spacing:30){
                            NavigationLink(destination:Payment().navigationBarHidden(true)) {
                                Text("Change payment method")
                                    .foregroundColor(dark_color)
                                    .font(.system(size: 20))
                                .fontWeight(.medium)
                            }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray)
                                .frame(width: UIScreen.main.bounds.width - 80, height: 4)
                            
                           
                            
                            NavigationLink(destination:{LastPurchased().navigationBarHidden(true)}) {
                                Text("Last purchases")
                                    .foregroundColor(dark_color)
                                    .font(.system(size: 20))
                                    .fontWeight(.medium)
                            }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray)
                                .frame(width: UIScreen.main.bounds.width - 80, height: 4)
                            
                            Text("FAQ")
                                .foregroundColor(dark_color)
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray)
                                .frame(width: UIScreen.main.bounds.width - 80, height: 4)
                            
                            Text("Log Out")
                                .foregroundColor(dark_color)
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                            
    //                        RoundedRectangle(cornerRadius: 20)
    //                            .fill(.gray)
    //                            .frame(width: UIScreen.main.bounds.width - 80, height: 4)
                                
                        }
    //                    .padding(.bottom,UIScreen.main.bounds.height/2)
                    }
                    .padding(.top,50)
    //                .frame(height:UIScreen.main.bounds.height/2)
    //                .offset(y:UIScreen.main.bounds.height/2)
    //                .frame(width: 0.0)
                    .ignoresSafeArea()
                }
                .padding(.top,30)

            }
            .navigationBarHidden(true)
            .ignoresSafeArea(edges: .bottom)
        }
    }
  
}

struct Preview_Personal:PreviewProvider{
    static var previews: some View{
        Personal()
    }
}
