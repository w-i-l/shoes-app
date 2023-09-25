//
//  CartView.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct CartView: View {
    
    @State private var showingCheckout: Bool = false
    
    @StateObject private var viewModel: CartViewModel = .init()
    
    var body: some View {
        ZStack {
            background_color.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Cart")
                        .foregroundColor(dark_color)
                        .font(.system(size: 32))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    VStack {
                        
                        // total price
                        Text(String(format:"%.2f", viewModel.price)+"$")
                            .foregroundColor(viewModel.cartProducts.isEmpty ? gray1 : .gray)
                            .font(.system(size: 18))
                            .fontWeight(.light)
                    }
                }
                .padding()
                
                // cart is empty
                if viewModel.cartProducts.isEmpty {
                    
                    Spacer()
                
                    Text("No Items here")
                        .foregroundColor(dark_color)
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                    
                    } else {
                    
                    
                    // displaying items
                    ScrollView(showsIndicators:false) {
                        ForEach(Array(viewModel.cartProducts.keys), id: \.self) { elem in
                            
                            CartItemView(
                                text: elem.name,
                                image: elem.imageArray[0],
                                item: elem,
                                viewModel: viewModel
                            )
                            
                            Divider()
                                .padding([.horizontal])
                                .opacity(elem == Array(viewModel.cartProducts.keys).last ? 0 : 1)
                        }
                        
                        HStack {
                            // clear cart
                            Button(
                                action: {
                                    viewModel.clearCart()
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(gray2)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: 50)
                                    
                                    Text("Empty cart")
                                        .foregroundColor(dark_color)
                                        .font(.system(size: 18))
                                        .fontWeight(.regular)
                                }
                            }
                            
                            // checkout
                            Button(
                                action: {
                                    showingCheckout = true
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(gray2)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: 50)
                                        .padding()
                                        .opacity(0.8)

                                    Text("Checkout")
                                        .foregroundColor(dark_color )
                                        .font(.system(size: 18))
                                        .fontWeight(.regular)

                                }
                            }
                        }
                    }
                }
                Spacer()
                
            }
        }
        .sheet(isPresented: $showingCheckout) {
            CheckoutView(viewModel: CheckoutViewModel(cartProducts: viewModel.cartProducts))
        }
    }
}

struct Preview_Cart: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
