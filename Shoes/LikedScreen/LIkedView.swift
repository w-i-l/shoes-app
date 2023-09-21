//
//  LIked.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct LikedView: View {
    
    @StateObject private var viewModel: LikedViewModel = .init()
    
    var body: some View {
        NavigationView {
            ZStack {
                background_color.ignoresSafeArea()
                
                VStack {
                    VStack {
                        HStack {
                            Text("Liked")
                                .foregroundColor(dark_color)
                                .font(.system(size: 32))
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            if !viewModel.likedProducts.isEmpty {
                                Button(
                                    action: {
                                        withAnimation(.easeInOut) {
                                            viewModel.removeAllLikedProducts()
                                        }
                                    }) {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(gray2)
                                                .frame(width:100,height:40)
                                            
                                            Text("Empty list")
                                                .foregroundColor(viewModel.likedProducts.isEmpty ? .gray : dark_color)
                                                .font(.system(size: 16))
                                                .fontWeight(viewModel.likedProducts.isEmpty ? .light : .medium)
                                        }
                                    }
                            }
                        }
                        .padding()
                        
                        if viewModel.likedProducts.isEmpty {
                            VStack {
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
                        } else {
                            ScrollView(showsIndicators:false) {
                                VStack {
                                    ForEach(viewModel.likedProducts, id:\.self) { elem in
                                        LikedCardView(elem.name, elem.imageArray[0])
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

struct Preview_Liked: PreviewProvider {
    static var previews: some View {
        LikedView()
    }
}
