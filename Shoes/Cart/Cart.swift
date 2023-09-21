//
//  Cart.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct Cart: View {
    
    
    @EnvironmentObject var showMenu: Storage
    @State var showingCheckout: Bool = false
    
    //TOTAL PRICE OF CART'S ITEMS
    var price: Double {
        
        get {
            
            var suma: Double = 0
            for x in showMenu.cart {
                suma += Double(x.key.price) * Double(x.value)
            }
            return suma
        }
    }
    
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
                        
                        //TOTAL PRICE
                        Text(String(format:"%.2f",price)+"$")
                            .foregroundColor(showMenu.cart.isEmpty ? gray1 : .gray)
                            .font(.system(size: 18))
                            .fontWeight(.light)
                    }
                }
                .padding()
                
                //CART IS EMPTY
                if showMenu.cart.isEmpty {
                    
                    Spacer()
                
                    Text("No Items here")
                        .foregroundColor(dark_color)
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                    
                    } else {
                    
                    
                    //DISPLAYIG THE MATCHED ITEMS
                    ScrollView(showsIndicators:false) {
                        ForEach(Array(showMenu.cart.keys),id:\.self) { elem in
                            
                            CartItem(elem.name, elem.imageArray[0])
                            
                            Divider()
                                .padding([.horizontal])
                                .opacity(elem == Array(showMenu.cart.keys).last ? 0 : 1)
                        }
                        
                        HStack {
                            //clear cart
                            Button(
                                action: {
                                    showMenu.cart = [Product:Int]()
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
                            
                            //checkout
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
            Checkout()
        }
    }
}

struct Preview_Cart: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}
