//
//  SearchView.swift
//  Tesla
//
//  Created by mishu on 28.07.2022.
//

import SwiftUI

struct SearchView: View {
    
    @State private var showOptions = false
    
    @StateObject private var viewModel: SearchViewModel = .init()

    var body: some View {
        NavigationView {
            ZStack {
            
            background_color.ignoresSafeArea()
            
            
                ScrollView(showsIndicators:false) {
                    VStack{
                        
                        //search bar
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(background_color)
                                .frame(width: UIScreen.main.bounds.width - 30, height: 40)
                                .opacity(0.4)
                                .shadow(color: .gray, radius: 3, y: 3)
                                .shadow(color: gray2, radius: 2, y: -3)
                                
                            
                            HStack {
                                  //SEARCH IMAGE
                                Image(systemName: "magnifyingglass.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(gray1)
                                    .frame(width: 30,height: 30)
                                    .padding(.leading,35)
                                   
                                TextField("Try 'Air MAX' ", text: $viewModel.textSearched)
                                    .accentColor(.black)
                                    .padding(10)
                                    .foregroundColor(.gray)
                                    .padding()
                                    .padding(.leading, -20)
                                
                                //DISPLAY DELETE BUTTON
                                if !viewModel.textSearched.isEmpty {
                                    
                                    Button(
                                        action: {
                                            viewModel.textSearched = ""
                                    }) {
                                        ZStack {
                                            Circle()
                                                .fill(gray2)
                                                .frame(width: 30,height: 30)
                                                .padding()
                                                .padding(.trailing, 10)
                                            Text("X")
                                                .foregroundColor(.gray)
                                                .frame(width: 30,height: 30)
                                                .padding()
                                                .padding(.trailing, 10)
                                                .font(.system(size: 16))
                                        }
                                    }
                                    .padding(.trailing, 10)
                                }
                            }
                        }
                        
                        //categories
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(ProductCategories.allCases, id: \.self) { category in
                                    
                                    Button(action:{
                                        viewModel.selectedCategory = category
                                    }) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 20)
                                                
                                                .fill(viewModel.selectedCategory == category ? gray1 : background_color)
                                                .frame(width: 125, height: 27)
                                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(dark_color,lineWidth: 0.2))
                                                .padding([.top,.bottom], 5)

                                            Text(category.rawValue)
                                                .foregroundColor(viewModel.selectedCategory == category ? dark_color : .gray)
                                                .font(.system(size: 17))
                                        }
                                    }
                                }
                            }
                        }
                        .padding([.leading,.trailing], 10)
                        
                        
                        //sort by
                            Button(
                                action: {
                                    withAnimation(.easeInOut){
                                        showOptions.toggle()
                                    }
                                }
                            )
                            {
                                HStack {
                                    DisclosureGroup("Sort by", isExpanded: $showOptions){
                                        ForEach(SortingCriteria.allCases, id: \.self){ criteria in
                                            HStack {
                                                Text(criteria.rawValue)
                                                    .foregroundColor(viewModel.sortingCriteria == criteria ? dark_color : Color(red: 0.7, green: 0.7, blue: 0.7))
                                                    .font(.system(size: 15))
                                                    .fontWeight(.light)
                                                    .onTapGesture(){
                                                        //CHANGING SORTING CRTITERIA
                                                        viewModel.sortingCriteria = criteria
                                                        withAnimation(.easeIn) {
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
                                    
                                    Text(viewModel.sortingCriteria.rawValue)
                                        .foregroundColor(dark_color)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 18))
                                }
                                .padding(.horizontal, 20)
                            }
                            .foregroundColor(dark_color)
                            .padding()
                            Spacer()
                        
                        //products
                        ScrollView(showsIndicators:false) {
                            VStack {
                                if !viewModel.arrayToShow.isEmpty {
                                    ForEach(Array(stride(from:0, to:viewModel.arrayToShow.count, by:2)),id: \.self) { no in
                                        HStack(spacing:10) {
                                            
                                            let firstCard = viewModel.arrayToShow[no]
                                            
                                            CardView(product: firstCard)

                                            //TO SIPLAY ON THE SECOND COLUMN
                                            if no+1<viewModel.arrayToShow.count{
                                                let secondCard = viewModel.arrayToShow[no + 1]
                                                CardView(product: secondCard)

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
        .padding([.leading,.trailing], -10)
    }
}

struct Preview_Search: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
