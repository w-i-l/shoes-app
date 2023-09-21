//
//  LastPurchase.swift
//  Tesla
//
//  Created by mishu on 16.08.2022.
//

import SwiftUI

struct LastPurchased: View {
    
    
    @EnvironmentObject var showMenu: Storage
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            background_color.ignoresSafeArea()
            
            NavigationView {
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
                        
                        Spacer()
                        
                        if !showMenu.purchased.isEmpty {
                            ScrollView(showsIndicators: false) {
                                ForEach(showMenu.purchased,id:\.self.0) { elem in
                                    NavigationLink(destination:Order(orderArray: elem.0, details: elem.1).navigationBarHidden(true)) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(gray2)
                                                .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                                            
                                            HStack {
                                                Text("Order no.\(showMenu.purchased.firstIndex(where:{$0 == elem})!)")
                                                    .foregroundColor(dark_color)
                                                    .font(.system(size: 24))
                                                    .fontWeight(.regular)
                                                
                                                Spacer()
                                                
                                                Image(elem.0.first!.key.imageArray[0])
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 75, height: 75)
                                            }
                                            .padding(.horizontal,40)
                                        }
                                    }
                                }
                            }
                            .padding(.top)
                        }
                        else{
                            Text("No orders yet")
                                .foregroundColor(dark_color)
                                .font(.system(size: 20))
                                .fontWeight(.light)
                        }
                        Spacer()
                    }
                    .navigationBarHidden(true)
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


struct preview:PreviewProvider{
    static var previews: some View{
        LastPurchased()
    }
}
