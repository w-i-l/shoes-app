//
//  APp.swift
//  Tesla
//
//  Created by mishu on 27.07.2022.
//

import SwiftUI

struct APP:View{
    
//    @State var selected = "house"
    @StateObject var showMenu = Storage()
    var body: some View{
        ZStack{
            background_color.ignoresSafeArea()
                            
            VStack{
                ZStack{
                    //to storage the curent page
                    Home()
                        .environmentObject(showMenu)
                        .opacity(showMenu.currentPage == "house" ? 1 : 0)
                    
                    Search()
                        .environmentObject(showMenu)
                        .opacity(showMenu.currentPage == "magnifyingglass" ? 1 : 0)
                    
                    Cart()
                        .environmentObject(showMenu)
                        .opacity(showMenu.currentPage == "cart" ? 1 : 0)
                    
                    Liked()
                        .environmentObject(showMenu)
                        .opacity(showMenu.currentPage == "heart" ? 1 : 0)
                    
                    Personal()
                        .environmentObject(showMenu)
                        .opacity(showMenu.currentPage == "person" ? 1 : 0)
                    
                }
//                .animation(.easeIn(duration: 0.2))
                
                Spacer()
                
                //menu
                if showMenu.showMenu {
                    HStack(spacing:50){
                        
                        ForEach(["house","magnifyingglass","cart","heart","person"],id:\.self){text in
                            ZStack {
                                Image(systemName: text)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height:showMenu.currentPage == text ? 30 : 25)
                                    .foregroundColor(showMenu.currentPage == text ? dark_color : .gray)
                                    .onTapGesture {
//                                        withAnimation(.linear){
                                        // changing current page
                                        showMenu.currentPage = text
//                                        }
                                }
                            }
                            
                        }
    //
                    }
                    .padding(.top,5)
                    .padding([.bottom],40)
                    .animation(.default)
                }
            }
            .transition(.opacity.animation(.default))
            .ignoresSafeArea(edges:.bottom)
            .ignoresSafeArea(.keyboard,edges: .bottom)
        }
    }
    
}

struct Preview_APP : PreviewProvider{
    static var previews: some View{
        APP()
    }
}
