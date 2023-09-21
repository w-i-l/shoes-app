//
//  OrderItem.swift
//  Tesla
//
//  Created by mishu on 16.08.2022.
//

import SwiftUI

struct OrderItem: View {
    
    let text: String
    let image: String
    let item: Product
    let pieces: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(background_color)
                .frame(width:UIScreen.main.bounds.width - 30 ,height:UIScreen.main.bounds.height / 5)
            
            HStack {
                VStack(spacing:10) {
                    Text(text)
                        .foregroundColor(dark_color)
                        .font(.system(size: 20))
                        .fontWeight(.light)
                    
                    Text("\(item.price*pieces)$")
                        .foregroundColor(dark_color)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                    
                    Text(pieces > 1 ? "\(pieces) products" : "1 product")
                        .foregroundColor(dark_color)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                }
                .padding(.horizontal)
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:UIScreen.main.bounds.width/2)
                    .rotationEffect(.degrees(27))
                    .padding(.bottom,30)
                    .padding(.trailing,-20)
            }
            
        }
    }
    
    init(_ text:String = "Zion 2", _ image:String="adidas",_ pieces:Int = 0){
        self.text = text
        self.image = image
        self.item = shoesArray.filter{$0.name == text}[0]
        self.pieces = pieces
    }
    
}
