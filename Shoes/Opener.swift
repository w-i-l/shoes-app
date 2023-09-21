//
//  Opener.swift
//  Tesla
//
//  Created by mishu on 27.07.2022.
//

import SwiftUI

struct Opener:View{
    
    @Environment(\.dismiss) private var dismiss
    @State private var opacity:Double = 1
    
    var body: some View{
        ZStack{
            background_color.ignoresSafeArea()
            VStack{
                
                Spacer()
                
                Image("nike")
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .frame(width:UIScreen.main.bounds.width - 50)
                    .padding(.top,100)
//                    .padding(.top,UIScreen.main.bounds.height/2)
            
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut){
                        self.opacity = 0
                    }
                }) {
                    ZStack {
                        
                        Circle()
                            .fill(gray1)
                            .frame(height:88)
                        
                        
                        Image(systemName: "arrow.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:31)
                            .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                    }
                    .frame()
                    .padding(.bottom,40)
                }
                
            }
        }
        .opacity(opacity)
    }
}

struct Opener_Preview:PreviewProvider{
    static var previews: some View{
        Opener()
    }
}
