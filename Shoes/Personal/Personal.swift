//
//  Personal.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct Personal: View {
    
    @EnvironmentObject var showMenu:Storage

    @State var ofsett: CGFloat = .zero
    @State var distance: CGFloat = .zero
    
    let cardWidth = CreditCard().width()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                background_color.ignoresSafeArea()
                
                VStack {
                    
                    showMenu.selectedCard
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(background_color)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .trim(from: 0.5, to: 1)
                                    .stroke(gray1, lineWidth: 2)
                            )

                        VStack(spacing:30) {
                            NavigationLink(destination: Payment().navigationBarHidden(true)) {
                                Text("Change payment method")
                                    .foregroundColor(dark_color)
                                    .font(.system(size: 20))
                                    .fontWeight(.medium)
                            }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray)
                                .frame(width: UIScreen.main.bounds.width - 80, height: 4)
                            
                           
                            
                            NavigationLink(destination:{LastPurchased().navigationBarHidden(true)}) {
                                Text("Last purchases")
                                    .foregroundColor(dark_color)
                                    .font(.system(size: 20))
                                    .fontWeight(.medium)
                            }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray)
                                .frame(width: UIScreen.main.bounds.width - 80, height: 4)
                            
                            Text("FAQ")
                                .foregroundColor(dark_color)
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray)
                                .frame(width: UIScreen.main.bounds.width - 80, height: 4)
                            
                            Text("Log Out")
                                .foregroundColor(dark_color)
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                
                        }
                    }
                    .padding(.top,50)
                    .ignoresSafeArea()
                }
                .padding(.top,30)

            }
            .navigationBarHidden(true)
            .ignoresSafeArea(edges: .bottom)
        }
    }
  
}

struct Preview_Personal: PreviewProvider {
    static var previews: some View {
        Personal()
    }
}
