//
//  LIked.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct Liked:View{
    
//    @State private var emptyList = false
    @EnvironmentObject var showMenu:Storage
    
    var body: some View{
        NavigationView {
            ZStack{
                background_color.ignoresSafeArea()
                
                VStack{
                    VStack{
                        HStack{
                            Text("Liked")
                                .foregroundColor(dark_color)
                                .font(.system(size: 32))
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            if !showMenu.liked.isEmpty{
                                Button(action:{
                                    withAnimation(.easeInOut){
        //                                self.emptyList.toggle()
                                        showMenu.liked = Array<Product>()
                                    }
                                }) {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(gray2)
                                            .frame(width:100,height:40)
                                        
                                        Text("Empty list")
                                            .foregroundColor(showMenu.liked.isEmpty ? .gray : dark_color)
                                            .font(.system(size: 16))
                                            .fontWeight(showMenu.liked.isEmpty ? .light : .medium)
                                            
                                        
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        if showMenu.liked.isEmpty{
                            VStack{
                                Spacer()
                                VStack {
                                    Text("Tap on icon to add favorites")
                                        .foregroundColor(dark_color)
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                    
                                    Image(systemName: "heart")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(dark_color)
                                    .frame(width: 30, height: 30)
                                }
                                Spacer()
                            }
                        }
                        
                        else {
                            ScrollView(showsIndicators:false){
                                VStack{
                                    ForEach(showMenu.liked, id:\.self){elem in
                                        LikedCard(elem.name, elem.imageArray[0])
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct Preview_Liked:PreviewProvider{
    static var previews: some View{
        Liked()
    }
}
