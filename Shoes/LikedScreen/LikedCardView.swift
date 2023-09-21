//
//  LikedCardView.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct LikedCardView: View {
    
    
    let text: String
    let image: String
    let product: Product
    
    @State private var movedLocation:CGFloat = .zero
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            
            //delete button
            Button(action:{
                LikedService.shared.removeLikedProduct(productID: product.id)
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .trim(from: 0.3, to: 0.7)
                        .fill(red_pastel)
                        .frame(width:UIScreen.main.bounds.width - 30,height:UIScreen.main.bounds.height / 5)
                        .rotationEffect(Angle.degrees(180))
                    
                    HStack {
                        Spacer()
                        
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(dark_color)
                            .frame(width: 40,height: 40)
                    }
                    .padding(.trailing,UIScreen.main.bounds.width / 11)
                }
            }
            .opacity(movedLocation < 0 ? 1 : 0)
            
            NavigationLink(
                destination:
                    Item(
                        product.name,
                        product.price,
                        product.imageArray,
                        product.logo,
                        product.subtitle,
                        product.rating,
                        product.reviews,
                        product.description,
                        product.sizes
                    ).navigationBarHidden(true),
                isActive: $isActive
            ) {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(pastels.randomElement()!)
                        .frame(width:UIScreen.main.bounds.width - 30, height:UIScreen.main.bounds.height / 5)
                    
                    HStack {
                        Text(text)
                            .foregroundColor(dark_color)
                            .font(.system(size: 26))
                            .fontWeight(.thin)
                        
                        Spacer()
                        
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:UIScreen.main.bounds.width / 1.9)
                            .rotationEffect(.degrees(27))
                            .padding(.bottom,30)
                            .padding(.trailing, -20)
                    }
                    .padding(.horizontal, 30)
                    .frame(width:UIScreen.main.bounds.width - 30,height:UIScreen.main.bounds.height / 5)
                    
                }
                .gesture (
                    DragGesture(minimumDistance: 15)
                        .onEnded { drag in
                            withAnimation(.default) {
                                if movedLocation==0 && drag.translation.width<0 {
                                    movedLocation = -75
                                } else if movedLocation == -75 && drag.translation.width > 0 {
                                    movedLocation = 0
                                }
                            }
                        }
                )
                .onTapGesture {
                    AppService.shared.showTabBar.value = false
                    isActive = true
                }
            }
            .offset(x:movedLocation)
        }
    }
    
    init(_ text:String = "Zion 2", _ image:String="adidas") {
        self.text = text
        self.image = image
        self.product = shoesArray.filter{$0.name == text}[0]
    }
}

struct Preview_LikedCard: PreviewProvider {
    static var previews: some View {
        LikedCardView()
    }
}
