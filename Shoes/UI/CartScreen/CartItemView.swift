//
//  LikedCardView.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct CartItemView: View {
    let text: String
    let image: String
    let item: Product
    
    @State private var movedLocation: CGFloat = .zero
    @ObservedObject var viewModel: CartViewModel
    
    
    var body: some View {
        ZStack {
            
            //delete button
            Button(action:{
                //delete from cart colection
                viewModel.removeProduct(product: item)
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(red_pastel)
                        .frame(width:UIScreen.main.bounds.width - 30, height:UIScreen.main.bounds.height / 5)
                    
                    HStack {
                        Spacer()
                        
                        Image(systemName: "trash.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(dark_color)
                            .frame(width: 40, height: 40)
                    }
                    .padding(.trailing,UIScreen.main.bounds.width / 11)
                }
            }
            
            //actual
            Group {
                RoundedRectangle(cornerRadius: 20)
                    .fill(background_color)
                    .frame(width:UIScreen.main.bounds.width - 30,height:UIScreen.main.bounds.height / 5)
                
                HStack(spacing :30) {
                    VStack {
                        Text(text)
                            .foregroundColor(dark_color)
                            .font(.system(size: 20))
                            .fontWeight(.light)
                        
                        Text("\(item.price)$")
                            .foregroundColor(dark_color)
                            .font(.system(size: 26))
                            .fontWeight(.medium)
                        
                        HStack(spacing:20) {
                            
                            Button(
                                action: {
                                    viewModel.cartProducts[item]! += 1
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
                            
                            Text("\(viewModel.cartProducts[item] ?? 0)")
                                .foregroundColor(dark_color)
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                            
                            Button(
                                action: {
                                    if viewModel.cartProducts[item]! == 1 {
                                        viewModel.cartProducts[item] = nil
                                    } else {
                                        viewModel.cartProducts[item]! -= 1
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
                        .frame(width:UIScreen.main.bounds.width / 2)
                        .rotationEffect(.degrees(27))
                        .padding(.bottom, 30)
                        .padding(.trailing, -20)
                }
            }
            .offset(x: movedLocation)
            .gesture(
                DragGesture(minimumDistance: 15)
                    .onEnded { drag in
                        print(drag.translation.width, movedLocation)
                        withAnimation(.default) {
                            
                            if movedLocation == 0 && drag.translation.width < 0 {
                                movedLocation = -75
                            } else if movedLocation == -75 && drag.translation.width > 0{
                                movedLocation = 0
                            }
                        }
                    }
            )
        }
        
    }
}
