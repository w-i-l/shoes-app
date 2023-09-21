//
//  Reviews.swift
//  Tesla
//
//  Created by mishu on 09.08.2022.
//

import SwiftUI

struct Reviews:View{
    
    let reviewsNumber:Int
    
    var body: some View{
        ZStack{
            background_color.ignoresSafeArea()
            VStack{
                ScrollView(showsIndicators:false) {
                    ForEach(0..<reviewsNumber){no in
                        VStack {
                            HStack{
                                //PERSON PICTURE
                                Image("person - \(no%4 == 0  ? 1 : no%4+1 )")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(gray1)
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                //USERNAME
                                Text(usernames.randomElement()!)
                                    .foregroundColor(dark_color)
                                    .font(.system(size: 20))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                //RATING
                                Text(String.init(format: "%.1f / 5", Double.random(in: 0.1...5)))
                                    .foregroundColor(dark_color)
                                    .font(.system(size: 18))
                                    .fontWeight(.regular)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(star_color)
                                    .frame(width: 20, height: 20)
                                
                            }
                            
                            Text(shoesReviews[no%5])
                                .foregroundColor(.gray)
                                .font(.system(size: 16))
                                .fontWeight(.light)
                            
                        }
                        .padding()
                    }
                }
            }
            .padding(.top,10)
        }
    }
    init(_ reviews:Int = 10){
        self.reviewsNumber = reviews
    }
}

struct Reviews_Preview:PreviewProvider{
    static var previews: some View{
        Reviews()
    }
}
