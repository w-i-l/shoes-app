//
//  OtherCard.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct OtherCard:View{
    
    let name:String
    let image:String
    let price:Int
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(background_color)
                
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(blue,lineWidth: 3)
                )
            
            VStack {
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .frame(width: UIScreen.main
//                            .bounds.width/3.2, height:UIScreen.main
//                            .bounds.width/5)
                
                Spacer()
                
                Text(name)
                    .foregroundColor(dark_color)
                    .font(.system(size: 20))
                    .fontWeight(.light)
//                    .padding(10)
                
                Text("\(price)$")
                    .foregroundColor(dark_color)
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    
                
            }
            .padding(5)
            
                
        }
        .padding(5)
        .frame(width: UIScreen.main
                .bounds.width/2.9, height: UIScreen.main
                .bounds.height/5)
        
    }
    init(_ name:String = "Zion 2",_ image:String = "adidas", _ price:Int = 199){
        self.name = name
        self.image = image
        self.price = price
    }
}

struct Preview_OtherCard:PreviewProvider{
    static var previews: some View{
        OtherCard()
    }
}
