//
//  APPViewModel.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import SwiftUI
import Combine

class BaseViewModel: ObservableObject {
    var bag: Set<AnyCancellable> = .init()
}

class APPViewModel: BaseViewModel {
    
    @Published var selectedTab: TabItem = .home
    @Published var showTabBar: Bool = true
    
    override init() {
        
        super.init()
        
        AppService.shared.selectedTab
            .zip(AppService.shared.showTabBar)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] selectedTab, showTabBar in
                self?.selectedTab = selectedTab
                self?.showTabBar = showTabBar
            }
            .store(in: &self.bag)
        
    }
    
    func setSelectedTab(tab: TabItem) {
        AppService.shared.setSelectedTab(tab: tab)
    }
}
