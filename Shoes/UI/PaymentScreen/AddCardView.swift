//
//  AddCard.swift
//  Shoes
//
//  Created by mishu on 18.08.2022.
//

import SwiftUI

struct AddCard: View {
    
    @ObservedObject var viewModel: PaymentViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var dissabled: Bool = true
    
    var body: some View {
        ZStack {
            background_color.ignoresSafeArea()
            
            VStack {
                
                // back button
                HStack {
                    Button(
                        action: {
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
                    
                    //add card
                    Button(
                        action:{
                            //only if the input are valid
                            // 16 + 3 white spaces
                            if viewModel.creditCardNumber.count == 19 && viewModel.holderName.count > 8 {
                                
                                viewModel.addCreditCard(creditCard: CreditCardModel(
                                    gradient: viewModel.gradient,
                                    cardNumber: viewModel.creditCardNumber,
                                    name: viewModel.holderName,
                                    expirationDate: viewModel.expirationDate
                                ))
                                dismiss()
                            }
                        }){
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(gray2)
                                    .frame(width: UIScreen.main.bounds.width / 3.2, height: 50)
                                    .padding()
                                    .opacity(0.8)
                                
                                Text("Add card")
                                    .foregroundColor(dark_color )
                                    .font(.system(size: 18))
                                    .fontWeight(.regular)
                                
                            }
                        }
                }
                
                
                CreditCardView(creditCardModel: CreditCardModel(
                    gradient: viewModel.gradient,
                    cardNumber: viewModel.creditCardNumber,
                    name: viewModel.holderName,
                    expirationDate: viewModel.expirationDate
                ))
                    .id([
                        viewModel.creditCardNumber,
                        viewModel.holderName,
                        CreditCardModel.dateFormatter.string(from: viewModel.expirationDate)
                         ])
                    .padding(.bottom,30)
                    .padding(.top,10)
                
                ScrollView(showsIndicators:false) {
                    
                    VStack(spacing:20) {
                        ForEach(Array(zip(
                            ["Card number", "Holder name"],
                            [$viewModel.creditCardNumber, $viewModel.holderName]
                        )),id: \.0) { elem in
                            VStack(spacing:0) {
                                HStack {
                                    Text(elem.0)
                                        .font(.system(size: 18))
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                    // TODO: Validari
                                    if elem.0 == "Card number" && false {
                                        Text("Incorect card number")
                                            .font(.system(size: 16))
                                            .fontWeight(.thin)
                                            .foregroundColor(red_pastel)
                                        
                                    } else if elem.0 == "Holder name" && false {
                                        Text("Incorect holder name")
                                            .font(.system(size: 16))
                                            .fontWeight(.thin)
                                            .foregroundColor(red_pastel)
                                    } else if elem.0 == "Expiration Date (MM/YY)" && false {
                                        Text("Incorect expiration date")
                                            .font(.system(size: 16))
                                            .fontWeight(.thin)
                                            .foregroundColor(red_pastel)
                                    }
                                }
                                .padding(.horizontal)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(gray2)
                                        .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                                        .padding(.horizontal)
                                    
                                    TextField("", text: elem.1)
                                        .foregroundColor(dark_color)
                                        .padding(.horizontal, 20)
                                        .keyboardType( (elem.0 == "Card number" || elem.0 == "Expiration Date (MM/YY)") ? .numberPad : .alphabet)
                                        .disableAutocorrection(true)
                                        .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                                }
                            }
                        }
                        
                        DatePicker(
                            "Expiration date",
                            selection: $viewModel.expirationDate,
                            in: Date()...,
                            displayedComponents: .date
                        )
                            .padding(.horizontal, 20)
                            .foregroundColor(dark_color)
                            .accentColor(dark_color)
                    }
                }
            }
        }
        //dismiss gesture
        .gesture(
            DragGesture(minimumDistance: 20)
                .onChanged { drag in
                    if drag.translation.width > 0 && drag.startLocation.x < UIScreen.main.bounds.width / 6{
                        // sa ii fac drag effect
                        dismiss()
                    }
                }
        )
    }
}

struct PreviewADD: PreviewProvider {
    static var previews: some View {
        AddCard(viewModel: PaymentViewModel())
    }
}