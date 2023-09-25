//
//  LastPurchase.swift
//  Tesla
//
//  Created by mishu on 16.08.2022.
//

import SwiftUI

struct LastPurchasedView: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: PersonalViewModel
    
    var body: some View {
        ZStack {
            background_color.ignoresSafeArea()
            
            NavigationView {
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
                        }
                        
                        Spacer()
                        
                        if !viewModel.orders.isEmpty {
                            ScrollView(showsIndicators: false) {
                                ForEach(Array(stride(from: viewModel.orders.count - 1, to: -1, by: -1)), id: \.self) { no in
                                    let elem = viewModel.orders[no]
                                    NavigationLink(destination: OrderView(order: elem).navigationBarHidden(true)) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(gray2)
                                                .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                                            
                                            HStack {
                                                Text("Order no.\(no)")
                                                    .foregroundColor(dark_color)
                                                    .font(.system(size: 24))
                                                    .fontWeight(.regular)
                                                
                                                Spacer()
                                                
                                                Image(elem.cartItems.first!.key.imageArray[0])
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
        LastPurchasedView(viewModel: PersonalViewModel())
    }
}
