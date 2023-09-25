//
//  Informational.swift
//  Shoes
//
//  Created by mishu on 19.08.2022.
//

import SwiftUI

struct InformationalView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var showMenu: Storage
    
    var body: some View {
        ZStack {
            background_color.ignoresSafeArea()
            
            VStack {
                
                //back button
                HStack {
                    Button(
                        action: {
                        
                        dismiss()
                        showMenu.showMenu = true
                        
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
                
                ScrollView {
                    
                    OnlyHeader(image: "run - 2", height: 250)
                    
                    Text("How to run properly?")
                        .foregroundColor(dark_color)
                        .font(.system(size: 28))
                        .fontWeight(.medium)
                        .padding()

                    ForEach(0..<3) { _ in
                        Text("As simple as running may be, it certainly isn’t easy. Especially when you’re a beginner. ‘You have to start where you are, not where you think you should be,’ says running coach and exercise physiologist Janet Hamilton. ‘If you go further or faster than you’re ready for, your body can’t adapt quickly enough and you’ll get injured.’ That’s why, with plans designed by highly experienced coach Sam Murphy, we’ve developed a five-part programme to take you from your very first steps to stepping up for your first race. So, are you ready?")
                            .foregroundColor(dark_color)
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .padding()
                    }
                }
            }
        }
        
    }
}

// streatchy header
struct OnlyHeader: View {
    let image: String
    let height: CGFloat
    var body: some View {
        
        
        GeometryReader { proxy in
        
            let lengh = proxy.frame(in: .global).minY
           
            if lengh <= 0 {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:proxy.size.width,height:proxy.size.height)
                    .offset(y:lengh/14)
                    .clipped()
            }
            else {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: lengh <= 0 ? proxy.size.height : proxy.size.height+lengh)
                    .clipped()
                    .offset(y:-lengh)
            }
        }
        .frame(height:height)
        
    }
    
    init (image: String = "Pamant", height:CGFloat = 300){
        self.image = image
        self.height = height
    }
}

struct previewS: PreviewProvider {
    static var previews: some View {
        InformationalView()
    }
}


