//
//  CardView.swift
//  Tesla
//
//  Created by mishu on 27.07.2022.
//

import SwiftUI

struct CardView: View {
    
    var product: Product
    
    @StateObject private var viewModel: CardViewModel = .shared
    @State private var isPresented = false
    
    var body: some View{

        NavigationLink(
            destination: ItemView(
                product.name,
                product.price,
                product.imageArray,
                product.logo,
                product.subtitle,
                product.rating,
                product.reviews,
                product.description,
                product.sizes
            )
                .navigationBarHidden(true),
            isActive: $isPresented
        ) {
            
            ZStack {
                
                // body
                RoundedRectangle(cornerRadius: 20)
                    .fill(gray2)
                    .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 2.5)
                
                // info
                VStack{
                    Image(product.imageArray[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 3,height: UIScreen.main.bounds.width / 3)
                    
                    Text(product.name)
                        .foregroundColor(dark_color)
                        .fontWeight(.medium)
                        .font(.system(size: product.name.count > 10 ? 16 : 20))
                        .padding(.top, -20)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 10)
                }
                
                // liked heart
                VStack {
                    HStack {
                        Image(systemName: viewModel.isProductLiked(productID: product.id) ? "heart.fill" : "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(viewModel.isProductLiked(productID: product.id) ? red_pastel : .gray)
                            .frame(width: 25, height: 25)
                        
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                .onTapGesture{
                    
                    //TO NOT ACTIVATE THE NAVIGATION LINK AND KEEP THE MENU
                    isPresented = false
                    
                    viewModel.hideTabBar()
                    viewModel.manageLikedProduct(product: product)
                }
                
            }
            .frame(width: UIScreen.main.bounds.width / 2.5,height: UIScreen.main.bounds.width / 2.5)
            .padding(5)
        }
        
        // 3D Touch similar gesture
        .contextMenu {
            Button(
                action: {
                    viewModel.manageLikedProduct(product: product)
                }) {
                    if viewModel.isProductLiked(productID: product.id) {
                        HStack {
                            Text("Remove from favorites")
                                .foregroundColor(dark_color)
                            
                            Spacer()
                            
                        }
                    } else {
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
}

