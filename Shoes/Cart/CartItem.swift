//
//  LikedCard.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct CartItem:View{
    
    
    let text:String
    let image:String
    @State var movedLocation:CGFloat = .zero
    let item:Product
   
    @EnvironmentObject var showMenu:Storage
    
    
    var body: some View{
        ZStack {
            
            
            //delete button
            Button(action:{
                //delete from cart colection
             
//                showMenu.cart.remove(shoesArray.filter{$0.name == text}[0])
                showMenu.cart[shoesArray.filter{$0.name == text}[0]] = nil
                
                            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(red_pastel)
                        .frame(width:UIScreen.main.bounds.width-30,height:UIScreen.main
                            .bounds.height/5)
                    
                    HStack{
                        Spacer()
                        
                        Image(systemName: "trash.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(dark_color)
                            .frame(width:40,height:40)
                    }
                    .padding(.trailing,UIScreen.main.bounds.width/11)
                }
            }
            
            //actual
            Group{
                RoundedRectangle(cornerRadius: 20)
//                    .fill(pastels.randomElement()!)
                    .fill(background_color)
                    .frame(width:UIScreen.main.bounds.width-30,height:UIScreen.main
                        .bounds.height/5)
                   
                
                HStack(spacing :30){
                    VStack {
                        Text(text)
                            .foregroundColor(dark_color)
                            .font(.system(size: 20))
                            .fontWeight(.light)
                        
                        Text("\(item.price)$")
                            .foregroundColor(dark_color)
                            .font(.system(size: 26))
                            .fontWeight(.medium)
                        
                        HStack(spacing:20){
                            
                            Button(action:{
                                
                                showMenu.cart[item]! += 1
                                
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(gray2)
                                        .frame(width: 25, height: 25)
                                    Text("+")
                                        .font(.system(size: 18))
                                        .foregroundColor(.gray)
                                        .fontWeight(.bold)
                                }
                            }
                            
                            Text("\(showMenu.cart[item] ?? 0)")
                                .foregroundColor(dark_color)
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                            
                            Button(action:{
                                if showMenu.cart[item]! == 1 {
                                    showMenu.cart[item] = nil
                                }
                                else{
                                    showMenu.cart[item]! -= 1
                                    }
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(gray2)
                                        .frame(width: 25, height: 25)
                                    Text("-")
                                        .font(.system(size: 18))
                                        .foregroundColor(.gray)
                                        .fontWeight(.bold)
                                }
                            }
                            
                        }
                        
                    }
                    
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:UIScreen.main.bounds.width/2)
                        .rotationEffect(.degrees(27))
                        .padding(.bottom,30)
                        .padding(.trailing,-20)
                }
            }
            .offset(x:movedLocation)
            .gesture(
                DragGesture(minimumDistance: 15)
                    .onEnded{drag in
                        print(drag.translation.width, movedLocation)
                        withAnimation(.default){
                            
                            if movedLocation==0 && drag.translation.width<0{
                                movedLocation = -75
                            }
                            else if movedLocation == -75 && drag.translation.width > 0{
                                movedLocation = 0
                            }
                        }
                    }
                    
            )
            
        }
          
    }
    init(_ text:String = "Zion 2", _ image:String="adidas"){
        self.text = text
        self.image = image
        self.item = shoesArray.filter{$0.name == text}[0]
    }
}

struct CardItem_Preview:PreviewProvider{
    static var previews: some View{
        CartItem()
    }
}
