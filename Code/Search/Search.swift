//
//  Search.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct Search:View{
    
    @EnvironmentObject var showMenu:Storage
    
    @State private var textSearched = ""
    @State private var selectedCategory = "all"
    @State private var sortingCriteria = "Price Low-High"
    @State private var showOptions = false
    @State private var focused = false
    let categories = ["all","running","lifestyle","gym","basketball","skateboarding"]
    let criterias = ["Price Low-High", "Price High-Low","Popularity","Newest"]
    
    var body: some View{
        NavigationView {
            ZStack{
            
            background_color.ignoresSafeArea()
            
            
                ScrollView(showsIndicators:false) {
                    VStack{
                        
                        //search bar
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
//                                .trim(from: 0, to: 0.5)
                                .fill(background_color)
                                .frame(width: UIScreen.main.bounds.width-30, height: 40)
                                .opacity(0.4)
                                .shadow(color: .gray, radius: 3, y: 3)
                                .shadow(color: gray2, radius: 2, y: -3)
//                                .innerShadow(color: background_color, cornerRadius: 20)
                                
                            
                            HStack {
                                  //SEARCH IMAGE
                                Image(systemName: "magnifyingglass.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(gray1)
                                    .frame(width:30,height:30)
                                    .padding(.leading,35)
                                   
                                TextField("Try 'Air MAX' ", text: $textSearched)
                                    .accentColor(.black)
                                    .padding(10)
                                    .foregroundColor(.gray)
                                    .padding()
                                    .padding(.leading,-20)
                                
                                //DISPLAY DELETE BUTTON
                                if !textSearched.isEmpty{
                                    
                                    Button(action:{
//                                        withAnimation(.easeIn){
                                            textSearched = ""
//                                        }
                                    }) {
                                        ZStack{
                                            Circle()
                                                .fill(gray2)
                                                .frame(width:30,height:30)
                                                .padding()
                                                .padding(.trailing,10)
                                            Text("X")
                                                .foregroundColor(.gray)
                                                .frame(width:30,height:30)
                                                .padding()
                                                .padding(.trailing,10)
                                                .font(.system(size:16))
                                        }
                                    }
                                    .padding(.trailing,10)
                                }
                                    
                                
                            }
                           
                        }
                        
                        //categories
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(categories,id:\.self){text in
                                    
                                    Button(action:{
//                                        withAnimation(.spring()){
                                        //CHANGE CURRENT CATEGORY
                                            selectedCategory = text
                                           
//                                        }
                                    }) {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 20)
                                                
                                                .fill(selectedCategory==text ? gray1 : background_color)
                                                .frame(width: 125, height: 27)
                                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(dark_color,lineWidth: 0.2))
                                                .padding([.top,.bottom],5)
                                                
                                            
                                               
                                            Text(text)
                                                .foregroundColor(selectedCategory == text ? dark_color : .gray)
                                                .font(.system(size: 17))
                                        }
                                    }
                                }
                            }
                        }
                        .padding([.leading,.trailing],10)
                        
                        
                        //sort by
                            Button(action:{
                                withAnimation(.easeInOut){
                                    showOptions.toggle()
                                }
                            })
                            {
                                DisclosureGroup("Sort by",isExpanded: $showOptions){
                                    ForEach(criterias,id:\.self){text in
                                        HStack {
                                            Text(text)
                                                .foregroundColor(sortingCriteria == text ? dark_color : Color(red: 0.7, green: 0.7, blue: 0.7))
                                                .font(.system(size: 15))
                                                .fontWeight(.light)
                                                .onTapGesture(){
                                                    //CHANGING SORTING CRTITERIA
                                                        sortingCriteria = text
                                                    withAnimation(.easeIn){
                                                        showOptions.toggle()
                                                    }
                                                }
                                            Spacer()
                                        }
                                        .padding(.leading)
                                    }
                                    .padding(5)
                                }
                                .accentColor(dark_color)
                                .foregroundColor(dark_color)
                                
                                Text(sortingCriteria)
                                    .foregroundColor(dark_color)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 18))
                            }
                            .foregroundColor(dark_color)
                            .padding()
                            Spacer()
                        
                        //products
                        ScrollView(showsIndicators:false) {
//                            VStack(spacing:15) {
//                                ForEach(0..<3){no in
//                                    HStack(spacing:15){
//                                        ForEach(0..<2){_ in
//                                            Card()
//                                        }
//                                    }
//
//                                }
//                            }
                            
                            VStack {
                                if !arrayToShow.isEmpty {
                                    ForEach(Array(stride(from:0,to:arrayToShow.count,by:2)),id:\.self){no in
                                        HStack(spacing:10){
                                            Card(arrayToShow[no].imageArray.first!,arrayToShow[no].name)
                                            //TO SIPLAY ON THE SECOND COLUMN
                                            if no+1<arrayToShow.count{
                                                Card(arrayToShow[no+1].imageArray.first!,arrayToShow[no+1].name)
                                            }
                                            else{
                                                Spacer()
                                            }
                                        }
                                    }
                                }
                                else{
                                    //IF NO ITEM WAS FOUND
                                    Text("No item")
                                        .foregroundColor(.gray)
                                        .font(.system(size:24))
                                        .fontWeight(.regular)
                                }
                            }
                            
                        }
                        .padding([.trailing,.leading],35)
                        
                        Spacer()
                        
                    }
                }
                
                
            }
            .navigationBarHidden(true)
        }
        .padding([.leading,.trailing],-10)
    }
    
    var arrayToShow:[Product]{
       
        
        if !textSearched.isEmpty{
            //SORT USING THE WORD SEARCHED FOR
            if !shoesArray.filter({$0.name.lowercased().starts(with: textSearched.lowercased())}).isEmpty{
                return shoesArray.filter{$0.name.lowercased().starts(with: textSearched.lowercased())}
                }
//            else{
//                [Product]()
//                
//            }
        }
        
        else{
            //SORTING USING CRITERIA
            if selectedCategory == "all"{
                
                if sortingCriteria == "Price Low-High"{
                    return shoesArray.sorted{$0.price < $1.price}
                }
                else if (sortingCriteria == "Price High-Low"){
                    return shoesArray.sorted{$0.price > $1.price}
                }
                else if (sortingCriteria == "Popularity"){
                    return shoesArray.sorted{$0.rating > $1.rating}
                }
                else if (sortingCriteria == "Newest"){
                    return shoesArray.sorted{$0.reviews > $1.reviews}
                }
                
                
                
            }
            else{
                return shoesArray.filter({selectedCategory == $0.category.rawValue})
            }
        }
        
       return [Product]()
    }
    
}

struct Preview_Search:PreviewProvider{
    static var previews: some View{
        Search()
    }
}
