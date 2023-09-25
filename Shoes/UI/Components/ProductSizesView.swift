//
//  Size.swift
//  Tesla
//
//  Created by mishu on 09.08.2022.
//

import SwiftUI

struct ProductSizesView: View {
    
    let sizes: [Int]
    
    var body: some View {
        ZStack{
            
            background_color.ignoresSafeArea()
            
            VStack {
                
                ScrollView(showsIndicators:false) {
                    ForEach(Array(stride(from: 0, through: sizes.count - 1, by: 2)), id: \.self) { no in
                        VStack {
                            HStack(spacing:30) {
                                Text("\(sizes[no])")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 50))
                                    .fontWeight(.bold)
                                
                                
                                if no+1 < sizes.count{
                                    
                                    Divider()
                                    
                                    Text("\(sizes[no+1])")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 50))
                                        .fontWeight(.bold)
                                }
                            }
                            
                            Divider()
                                .padding(.horizontal, 60)
                                .padding(.vertical, 10)
                        }
                        
                    }
                }
                .padding(.top,UIScreen.main.bounds.height / 5 + 10)
            }
           
            
        }
       
    }
    init(_ sizes:[Int] = [40, 41, 42, 43, 46, 47]) {
        self.sizes = sizes
    }
}

struct Sizes_Preview:PreviewProvider{
    static var previews: some View{
        ProductSizesView()
    }
}
