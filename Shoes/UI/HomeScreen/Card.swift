//
//  Card.swift
//  Tesla
//
//  Created by mishu on 27.07.2022.
//

import SwiftUI

struct Card:View{
    
    var image:String
    var text:String
    var item:Product
    
    @EnvironmentObject var showMenu: Storage
    @State private var isPresented = false
    
    
    var body: some View{
        
        //GO TO ITEM PAGE
        NavigationLink(
            destination: Item(
                item.name,
                item.price,
                item.imageArray,
                item.logo,
                item.subtitle,
                item.rating,
                item.reviews,
                item.description,
                item.sizes
            )
                .navigationBarHidden(true),
            isActive: $isPresented
        ) {
            
            ZStack {
                
                //BODY
                RoundedRectangle(cornerRadius: 20)
                    .fill(gray2)
                    .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 2.5)
                    .innerShadow(color: gray2)
                
                //INFOS
                VStack{
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 3,height: UIScreen.main.bounds.width / 3)
                    
                    Text(text)
                        .foregroundColor(dark_color)
                        .fontWeight(.medium)
                        .font(.system(size: text.count > 10 ? 16 : 20))
                        .padding(.top, -20)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 10)
                }
                
                // liked heart
                VStack {
                    HStack {
                        Image(systemName: !showMenu.liked.filter{$0.name == self.text}.isEmpty ? "heart.fill" : "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(!showMenu.liked.filter{$0.name == self.text}.isEmpty ? red_pastel : .gray)
                            .frame(width: 25, height: 25)
                        
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                .onTapGesture{
                    
                    //TO NOT ACTIVATE THE NAVIGATION LINK AND KEEP THE MENU
                    isPresented = false
                    showMenu.showMenu = true
                    
                    //IF IT IS LIKED OR NOT TO APPEND OR REMOVE
                    if !showMenu.liked.filter({$0.name == self.text}).isEmpty{
                        showMenu.liked = showMenu.liked.filter{$0.name != self.text}
                    }
                    else{
                        showMenu.liked.append(shoesArray.filter{$0.name == self.text}[0])
                    }
                    
                }
                
            }
            .frame(width: UIScreen.main.bounds.width / 2.5,height: UIScreen.main.bounds.width / 2.5)
            .padding(5)
            .onTapGesture() {
                // GO TO ITEM PAGE
                showMenu.showMenu = false
                isPresented = true
            }
        }
        
        //ON LONG PRESS SIMILAR WITH 3DTOUCH
        .contextMenu {
            
            //IF IT IS LIKED
            if !showMenu.liked.filter{$0 == self.item}.isEmpty {
                Button(
                    action: {
                        showMenu.liked = showMenu.liked.filter{ $0 != self.item }
                    }) {
                        HStack {
                            Text("Remove from favorites")
                                .foregroundColor(dark_color)
                            
                            Spacer()
                            
                        }
                    }
            }
            // IF IT IS NOT LIKED
            else {
                Button(
                    action: {
                        showMenu.liked.append(item)
                        
                    }) {
                        HStack {
                            Text("Add to favorites")
                                .foregroundColor(dark_color)
                            
                            Spacer()
                            
                            Image(systemName: "heart")
                        }
                    }
            }
        }
    }
    
    init(_ image: String = "adidas",_ text: String = "Zion 2"){
        self.image = image
        self.text = text
        self.item = shoesArray.filter{ $0.name == text }[0]
    }
}

struct Home_Previews:PreviewProvider {
    static var previews: some View {
        Search()
    }
}
