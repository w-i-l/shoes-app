//
//  Order.swift
//  Tesla
//
//  Created by mishu on 16.08.2022.
//

import SwiftUI

struct Order:View{
    
    @Environment(\.dismiss) var dismiss
    
    let orderArray:Dictionary<Product,Int>
    let details:[String]
    
    var price:Double{
        
        get{
            
            var suma:Double = 0
            for x in orderArray{
                suma += Double(x.key.price) * Double(x.value)
            }
            return suma
        }
        
    }
    
    var body: some View{
        ZStack{
            background_color.ignoresSafeArea()
            
            VStack{
                
                //back button
                HStack{
                    Button(action:{
                        
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
                
                ScrollView(){
                    ForEach(orderArray.sorted(by: {$0.key.name>$1.key.name}),id:\.key){key,value in
                        OrderItem(key.name, key.imageArray[0], value)
                        Divider()
                    }
                    Text(String(format:"Total: %.1f",price)+"$")
                        .foregroundColor(dark_color)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                        .padding()
                    
                    ForEach(Array(zip(["Street","Number","Town","Region","Country","Payment method"],details)),id:\.self.0){elem in
                        HStack {
                            Text(elem.0+"   :   "+elem.1)
                                .foregroundColor(dark_color)
                                .font(.system(size: 20))
                                .fontWeight(.light)
                            Spacer()
                        }
                        .padding(.leading)
                            
                    }
                }
            }
            
        }
        //dismiss gesture
        .gesture(
            DragGesture(minimumDistance:20)
//                .onChanged({ el in
//                    self.ofset = el.translation.width
//                })
                .onChanged{el in
                    if el.translation.width > 0 && el.startLocation.x < UIScreen.main.bounds.width/6{
                        // sa ii fac drag effect
                        dismiss()
                      
                        
                    }
                }
        )
    }
}

struct PrevieR:PreviewProvider{
    static var previews: some View{
        Order(orderArray: [Product():3], details: [" 2","3 ","4","5","5","5"])
    }
}
