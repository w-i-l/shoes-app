//
//  Payment.swift
//  Tesla
//
//  Created by mishu on 16.08.2022.
//

import SwiftUI

struct Payment: View {
    
    @EnvironmentObject var showMenu: Storage
    @Environment(\.dismiss) var dismiss
    
    @State var update: Bool = false
    
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
                }
                
                
                NavigationLink(destination: AddCard().navigationBarHidden(true)) {
                    HStack {
                        
                        ZStack {
                            Circle()
                                .fill(gray1)
                                .frame(width: 40, height: 40)
                            
                            Text("+")
                                .foregroundColor(.gray)
                                .font(.system(size: 20))
                                .fontWeight(.light)
                        }
                        
                        Text("Add card")
                            .foregroundColor(dark_color)
                            .font(.system(size: 24))
                            .fontWeight(.regular)
                    }
                }
                
                ScrollView(showsIndicators:false) {
                    VStack() {
                        ForEach(showMenu.creditCards, id: \.self.creditCardModel.cardNumber) { elem in
                            Button(
                                action:{
                                    showMenu.selectedCard = elem
                                    dismiss()
                                }) {
                                    elem
                                        .padding()
                                }
                            
                        }
                        
                        //just leave it here :))
                        Rectangle()
                            .fill(background_color)
                            .frame(height:5)
                    }
                }
            }
            
            .padding(.vertical)
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

struct Payment_Provider: PreviewProvider {
    static var previews: some View {
        Payment()
    }
}
