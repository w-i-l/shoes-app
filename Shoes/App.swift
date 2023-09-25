//
//  APp.swift
//  Tesla
//
//  Created by mishu on 27.07.2022.
//

import SwiftUI

struct APP: View {
    
    @StateObject private var viewModel: APPViewModel = .init()
    
    var body: some View {
        ZStack {
            background_color.ignoresSafeArea()
                            
            VStack {
                ZStack {
                    //to storage the curent page
                    HomeView()
                        .opacity(viewModel.selectedTab == .home ? 1 : 0)
                    
                    SearchView()
                        .opacity(viewModel.selectedTab == .search ? 1 : 0)
                    
                    CartView()
                        .opacity(viewModel.selectedTab == .cart ? 1 : 0)
                    
                    LikedView()
                        .opacity(viewModel.selectedTab == .liked ? 1 : 0)
                    
                    PersonalView()
                        .opacity(viewModel.selectedTab == .personal ? 1 : 0)
                    
                }
                
                Spacer()
                
                //menu
                if viewModel.showTabBar {
                    HStack(spacing:50){
                        
                        ForEach(TabItem.allCases , id: \.self) { tab in
                            ZStack {
                                Image(systemName: tab.rawValue)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: viewModel.selectedTab == tab ? 30 : 25)
                                    .foregroundColor(viewModel.selectedTab == tab ? dark_color : .gray)
                                    .onTapGesture {
                                        viewModel.setSelectedTab(tab: tab)
                                }
                            }
                        }
                    }
                    .padding(.top,5)
                    .padding([.bottom],40)
                }
            }
            .transition(.opacity.animation(.default))
            .ignoresSafeArea(edges:.bottom)
            .ignoresSafeArea(.keyboard,edges: .bottom)
        }
    }
    
}

struct Preview_APP : PreviewProvider{
    static var previews: some View{
        APP()
    }
}
