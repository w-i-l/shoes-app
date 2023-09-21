//
//  LikedCard.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct LikedCard:View{
    
    
    let text:String
    let image:String
    let item:Product
    
    @State var movedLocation:CGFloat = .zero
    @State var isActive = false
    
    @EnvironmentObject var showMenu:Storage
    
    
    var body: some View{
        ZStack {
            
            
            //delete button
            Button(action:{
                
                showMenu.liked = showMenu.liked.filter{$0.name != self.text}
                
                
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .trim(from: 0.3, to: 0.7)
                        .fill(red_pastel)
                        .frame(width:UIScreen.main.bounds.width-30,height:UIScreen.main.bounds.height/5)
                        .rotationEffect(Angle.degrees(180))
                    
                    HStack{
                        Spacer()
                        
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(dark_color)
                            .frame(width:40,height:40)
                    }
                    .padding(.trailing,UIScreen.main.bounds.width/11)
                }
            }
            .opacity(movedLocation < 0 ? 1 : 0)
            
            NavigationLink(destination:Item(item.name, item.price, item.imageArray, item.logo, item.subtitle, item.rating, item.reviews, item.description, item.sizes).navigationBarHidden(true),isActive: $isActive) {
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(pastels.randomElement()!)
                        .frame(width:UIScreen.main.bounds.width-30,height:UIScreen.main
                                .bounds.height/5)
                    
                    HStack{
                        Text(text)
                            .foregroundColor(dark_color)
                            .font(.system(size: 26))
                            .fontWeight(.thin)
                        
                        Spacer()
                        
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:UIScreen.main.bounds.width/1.9)
                            .rotationEffect(.degrees(27))
                            .padding(.bottom,30)
                            .padding(.trailing,-20)
                    }
                    .padding(.horizontal,30)
                    .frame(width:UIScreen.main.bounds.width-30,height:UIScreen.main
                            .bounds.height/5)
                    
                }.gesture(
                    DragGesture(minimumDistance: 15)
                        .onEnded{drag in
                            //                        print(drag.translation.width, movedLocation)
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
                    .onTapGesture {
                        showMenu.showMenu = false
                        isActive = true
                    }
            }
            
            .offset(x:movedLocation)
            
            
            
        }
        
        
    }
    init(_ text:String = "Zion 2", _ image:String="adidas"){
        self.text = text
        self.image = image
        self.item = shoesArray.filter{$0.name == text}[0]
    }
}

struct Preview_LikedCard:PreviewProvider{
    static var previews: some View{
        LikedCard()
    }
}
