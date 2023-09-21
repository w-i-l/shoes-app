//
//  AddCard.swift
//  Shoes
//
//  Created by mishu on 18.08.2022.
//

import SwiftUI

struct AddCard: View {
    
    @EnvironmentObject var showMenu: Storage
    @ObservedObject var value: NumbersOnly = NumbersOnly()
    
    @Environment(\.dismiss) var dismiss
    @State var dissabled:Bool = true
    
    var body: some View {
        ZStack {
            background_color.ignoresSafeArea()
            
            VStack {
                
                //back button
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
                            if value.cardNumber.count == 16 && value.holderName.count > 8 && value.expirationDate.count == 4 && Int(value.expirationDate)! <= 1299 {
                                
                                showMenu.creditCards.append(CreditCard(
                                    LinearGradient(
                                        colors: [
                                            Color(
                                                red: Double.random(in: 0...1),
                                                green: Double.random(in: 0...1),
                                                blue: Double.random(in: 0...1)
                                            ),
                                            Color(
                                                red: Double.random(in: 0...1),
                                                green: Double.random(in: 0...1),
                                                blue: Double.random(in: 0...1)
                                            )
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    value.cardNumber,
                                    value.holderName,
                                    value.expirationDate
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
                
                
                CreditCard(
                    LinearGradient(
                        colors: [.gray, dark_color],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    value.cardNumber,
                    value.holderName,
                    value.expirationDate
                )
                    .id([value.cardNumber, value.holderName, value.expirationDate])
                    .padding(.bottom,30)
                    .padding(.top,10)
                
                ScrollView(showsIndicators:false) {
                    
                    VStack(spacing:20) {
                        ForEach(Array(zip(["Card number","Holder name","Expiration Date (MM/YY)"],[$value.cardNumber,$value.holderName,$value.expirationDate])),id: \.0) { elem in
                            VStack(spacing:0) {
                                HStack {
                                    Text(elem.0)
                                        .font(.system(size: 18))
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                    
                                    if elem.0 == "Card number" && value.cardNumber.count < 16 && value.cardNumber != " " {
                                        Text("Incorect card number")
                                            .font(.system(size: 16))
                                            .fontWeight(.thin)
                                            .foregroundColor(red_pastel)
                                        
                                    } else if elem.0 == "Holder name" && value.holderName.count < 8 && value.holderName != " " {
                                        Text("Incorect holder name")
                                            .font(.system(size: 16))
                                            .fontWeight(.thin)
                                            .foregroundColor(red_pastel)
                                    } else if elem.0 == "Expiration Date (MM/YY)" && value.expirationDate.count < 6 && Int(value.expirationDate) ?? 0 > 1299 && value.expirationDate != " " {
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
                                    
                                    TextField("",text:elem.1)
                                        .foregroundColor(dark_color)
                                        .padding(.horizontal,20)
                                        .keyboardType( (elem.0 == "Card number" || elem.0 == "Expiration Date (MM/YY)") ? .numberPad : .alphabet)
                                        .disableAutocorrection(true)
                                        .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                                    
                                    
                                    
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        //dismiss gesture
        .gesture(
            DragGesture(minimumDistance:20)
                .onChanged{el in
                    if el.translation.width > 0 && el.startLocation.x < UIScreen.main.bounds.width/6{
                        // sa ii fac drag effect
                        dismiss()
                    }
                }
        )
    }
}

struct PreviewADD: PreviewProvider {
    static var previews: some View {
        AddCard()
    }
}
