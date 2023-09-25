//
//  ItemView.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//
import SwiftUI

struct ItemView: View {
    
    let name: String
    let price: Int
    let imageArray: [String]
    let logo: String
    let category: String
    let stars: Double
    let reviews: Int
    let description: String
    let sizes: [Int]
    let item: Product
    
    @State private var selectedImage: String = ""
    @State private var selectedSize = 41
    @State private var ofset = CGFloat.zero
    @State private var showingSheet = false
    @State private var showingSizes = false
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: ItemViewModel = .init()
    
    var body: some View {
        
        ZStack {
            background_color.ignoresSafeArea()
            
            VStack {
                
                //back button
                HStack {
                    Button(
                        action: {
                            
                            dismiss()
                            AppService.shared.showTabBar.value = true
                            
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
                
                // body
                ScrollView(showsIndicators:false) {
                    HStack {
                        // name
                        Text(name)
                            .foregroundColor(dark_color)
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Image(logo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 80)
                    }
                    .padding()
                    
                    // shoes category
                    HStack {
                        Text(category)
                            .foregroundColor(.gray)
                            .font(.system(size: 20))
                            .fontWeight(.light)
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.top, self.name.count > 10 ? -40 : -60)
                    
                    // main image
                    Image(selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 3)
                        .rotationEffect(imageArray.first! == selectedImage ? .degrees(-20) : .zero)
                        .padding([.trailing,.bottom,.top], 20)
                    
                    
                    // image gallery
                    HStack(spacing:30) {
                        ForEach(imageArray,id:\.self) { image in
                            Button(
                                action: {
                                    selectedImage = image
                                }) {
                                    Image(image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.width / 4.8, height: UIScreen.main.bounds.width / 4.8)
                                        .overlay(selectedImage == image ?
                                                 //IF IT IS THE SELECTED IMAGE TO BORDER IT
                                                 RoundedRectangle(cornerRadius: 20)
                                                    .trim(from: 0, to: 1)
                                                    .stroke(blue,lineWidth: 2)
                                                    .padding(-5)
                                                 : RoundedRectangle(cornerRadius: 20)
                                                    .trim(from: 0.1, to: 0.4)
                                                    .stroke(gray1,lineWidth: 2)
                                                    .padding(-3)
                                                 
                                        )
                                }
                            
                        }
                    }
                    
                    // rating
                    HStack {
                        Text(String.init(format: "%.1f/5", stars))
                            .foregroundColor(dark_color)
                            .font(.system(size: 24))
                            .fontWeight(.regular)
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(star_color)
                            .frame(width: 30, height: 30)
                        
                        Spacer()
                        
                        Text("\(reviews) Reviews")
                            .foregroundColor(dark_color)
                            .font(.system(size: 24))
                            .fontWeight(.regular)
                        
                    }
                    .padding([.leading,.trailing,.top], 30)
                    .onTapGesture{
                        showingSheet = true
                    }
                    
                    // feedback hub
                    .sheet(isPresented: $showingSheet) {
                        ReviewsView(reviewsNumber: reviews)
                            .onTapGesture {
                                showingSheet = false
                            }
                    }
                    
                    // description
                    Text(description)
                        .foregroundColor(dark_color)
                        .font(.system(size: 14))
                        .fontWeight(.light)
                        .padding()
                        .multilineTextAlignment(.leading)
                    
                    // sizes
                    HStack(spacing:30) {
                        ForEach(0..<(sizes.count > 4 ? 4 : sizes.count)) { no in
                            Button(action:{
                                selectedSize = sizes[no]
                            }) {
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(selectedSize == sizes[no] ? blue_pastel : gray2)
                                        .frame(width: 60, height: 60)
                                    
                                    Text("\(sizes[no])")
                                        .foregroundColor(dark_color)
                                        .font(.system(size: 24))
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                    .padding()
                    
                    //search for size
                    Button(
                        action: {
                            
                        }) {
                            HStack{
                                Spacer()
                                
                                Text("Search for your size")
                                    .foregroundColor(dark_color)
                                    .font(.system(size: 18))
                                    .fontWeight(.light)
                                
                                Image(systemName:"arrow.right")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(dark_color)
                                    .padding(.trailing)
                                
                            }
                            .padding(.top, -10)
                            // size hub
                            .onTapGesture {
                                showingSizes = true
                            }
                            .sheet(isPresented: $showingSizes) {
                                ProductSizesView(sizes)
                                    .onTapGesture {
                                        showingSizes = false
                                    }
                                
                            }
                        }
                    
                    RoundedRectangle(cornerRadius: 0)
                        .fill(background_color)
                        .frame(height: 100)
                }
                .padding(.top, -10)
                .padding([.leading,.trailing])
                
                Spacer()
                
            }
            
            
            // 	buy widget
            VStack {
                
                Spacer()
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 40)
                        .fill(LinearGradient(
                            colors: [gray2, Color(red:0.8,green:0.85,blue:0.99)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                    
                        .opacity(1)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(gray1, lineWidth: 1)
                                .blur(radius: 1)
                        )
                    
                    // if the product is not in cart
                    if !viewModel.isProductInCart(productID: item.id) {
                        HStack() {
                            
                            Text("\(price)$")
                                .foregroundColor(dark_color)
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            //buy
                            Button(
                                action: {
                                    viewModel.addProduct(product: item)
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(blue)
                                        .frame(width: (UIScreen.main.bounds.width - 100) / 2, height: 50)
                                    
                                    Text("Buy")
                                        .foregroundColor(gray1)
                                        .font(.system(size: 30))
                                        .fontWeight(.semibold)
                                }
                                
                            }
                        }
                        .padding([.leading,.trailing], 25)
                    }
                    // if the product is in the cart
                    else {
                        HStack {
                            Text("Added")
                                .font(.system(size: 24))
                                .foregroundColor(dark_color)
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                            Button(action:{
                                // go to cart screen
                                AppService.shared.setSelectedTab(tab: .cart)
                                AppService.shared.showTabBar.value = true
                            }){
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(blue)
                                        .frame(width: (UIScreen.main.bounds.width - 100) / 2, height: 50)
                                    Text("Go to cart")
                                        .foregroundColor(gray1)
                                        .font(.system(size: 26))
                                        .fontWeight(.semibold)
                                }
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 80)
                .padding(.bottom, 20)
            }
            
            
            
        }
        .ignoresSafeArea(edges: .bottom)
        // back gesture
        .gesture(
            DragGesture(minimumDistance: 20)
                .onChanged{el in
                    if el.translation.width > 0 && el.startLocation.x < UIScreen.main.bounds.width / 6{
                        // sa ii fac drag effect
                        AppService.shared.showTabBar.value = true
                        dismiss()
                    }
                }
            
            
        )
        
    }
    
    init(_ name:String = "Zion 2",_ price :Int=199, _ imageArray:[String] = ["adidas","adidas2","adidas3"],_ logo:String = "nike", _ category:String = "Men Running Shoes", _ stars:Double = 4.5, _ reviews:Int = 21, _ description:String = "Channel new levels of speed and power in shoes designed for Zion and built for ballers at any level. An adjustable strap on the top helps lock in your",_ sizes:[Int] = [40,41,42,43,44,46]){
        
        self.name = name
        self.imageArray = imageArray
        self.price = price
        self.logo = logo
        self.category = category
        self.stars = stars
        self.reviews = reviews
        self.description = description
        self._selectedImage = State(initialValue: imageArray[0])
        self.sizes = sizes
        self.item = shoesArray.filter{$0.name == name}[0]
    }
}

struct Preview_Item:PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
