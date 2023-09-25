//
//  CheckoutView.swift
//  Shoes
//
//  Created by mishu on 22.08.2022.
//

import SwiftUI

struct CheckoutView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: CheckoutViewModel
    
    var body: some View {
        ZStack {
            background_color.ignoresSafeArea()
            
            VStack(spacing:0) {
                
                
                //back button
                HStack {
                    Button(action:{
                        
                        dismiss()
                        
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(dark_color)
                            .padding(.leading)
                    }
                
                    Spacer()
                    
                    Text("Checkout")
                        .foregroundColor(dark_color)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .padding()
                        .padding(.leading, -40)
                    
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    
                    HStack {
                        Text("Shipping info")
                            .foregroundColor(dark_color)
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                        
                        Spacer()
                        
                    }
                    .padding()
                    
                    ForEach(Array(zip(
                        ["Street", "Number", "Town", "Region", "Country"],
                        [$viewModel.street, $viewModel.number, $viewModel.town, $viewModel.region, $viewModel.country]
                    )),id: \.0)  { elem in
                        VStack {
                            HStack {
                                Text(elem.0)
                                    .foregroundColor(.gray)
                                    .fontWeight(.medium)
                                    .font(.system(size: 18))
                                
                                Spacer()
                            }
                            .padding(.bottom, -5)
                            .padding(.leading, 30)
                            
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(elem.1.wrappedValue.isEmpty ? red_pastel : gray2, lineWidth: 2)
                                
                                TextField("", text: elem.1)
                                    .foregroundColor(dark_color)
                                    .frame(height: 40)
                                    .font(.system(size: 20))
                                    .padding(.horizontal)
                                    .onTapGesture {
                                        elem.1.wrappedValue = ""
                                    }
                                    
                                    
                            }
                            .frame(height: 50)
                            .padding(.horizontal, 30)
                        }
                        .padding(.vertical, 5)
                    }
                    
                    
                    HStack {
                        Text("Payment method")
                            .foregroundColor(dark_color)
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                        
                        Spacer()
                        
                    }
                    .padding()
                    .padding(.top,30)
                    
                    HStack {
                        ForEach(PaymentMethod.allCases, id: \.self) { elem in
                            Button {
                                viewModel.paymentMethod = elem
                            } label: {
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(elem == viewModel.paymentMethod ? dark_color: gray2, lineWidth:  2)
                                        .frame(height:50)
                                    
                                    Text(elem.rawValue.capitalized)
                                        .foregroundColor(elem == viewModel.paymentMethod ? dark_color: gray1)
                                        .fontWeight(.medium)
                                        .font(.system(size: 20))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                
                }
                .padding(.bottom)
                
                
                Button {
                    
                    for x in [viewModel.street, viewModel.number, viewModel.town, viewModel.region, viewModel.country] {
                        if x.isEmpty || x == " " {
                            return
                        }
                    }
                    
                    viewModel.addOrder()
                    CartService.shared.cartProducts.value = [:]
                    dismiss()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(
                                colors: [gray2, gray1],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: UIScreen.main.bounds.width / 3, height: 75)
                        
                        Text("Proceed")
                            .foregroundColor(dark_color)
                            .fontWeight(.bold)
                            .font(.system(size:20))
                        
                    }
                }
            }
        }
    }
}

struct CheckOut_Preview:PreviewProvider{
    static var previews: some View{
        CheckoutView(viewModel: CheckoutViewModel(cartProducts: [:]))
    }
}
