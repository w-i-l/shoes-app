//
//  Home.swift
//  Tesla
//
//  Created by mishu on 27.07.2022.
//

import SwiftUI

struct Home:View{
    
    @EnvironmentObject var showMenu:Storage
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack {
                background_color.ignoresSafeArea()
                 VStack{
                     ScrollView(showsIndicators:false) {
                        
                        //HEADER TITLE
                        Image("moto")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:200)
                        
                         //OPEN IMAGE
                        Image("running_person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: width-50)
                            .padding()
                           
                        
                        //INFORMATIONAL
                         ScrollView(.horizontal,showsIndicators:false) {
                             HStack(spacing:20){
                                 ForEach(["run","swim","climb"],id:\.self){elem in
                                     NavigationLink(destination: Run().navigationBarHidden(true)) {
                                         ZStack{
                                            
                                            Image(elem)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/4)
                                                .overlay(.gray.opacity(0.7))
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
    //                                            .opacity(0.7)
                                               
                                            
                                            Text("Learn how to\n"+elem.capitalized)
                                                .foregroundColor(white)
                                                .font(.system(size: 20))
                                                .fontWeight(.medium)
                                                .multilineTextAlignment(.center)
                                         }
                                    
                                    }
                                }
                             }
                         }
                        
                        
                        //new arrivals
                        HStack{
                            Text("NEW")
                                .foregroundColor(dark_color)
                                .fontWeight(.semibold)
                                .font(.system(size:24))
                            Text("Arrivals")
                                .foregroundColor(dark_color)
                                .fontWeight(.regular)
                                .font(.system(size:24))
                            Spacer()
                        }
                        .padding()
                     
                        //NEW ARRIVAL SHOES
                        ForEach(0..<2){number in
                            HStack(spacing: 10){
                                ForEach(0..<2){no in
                                    Card(shoesArray[2*number+(no+1)].imageArray[0], shoesArray[2*number+(no+1)].name)
                                            
                                    }
                                }
                            }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
}

struct Home_Preview:PreviewProvider{
    static var previews: some View{
        Home()
    }
}
