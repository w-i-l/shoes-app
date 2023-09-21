//
//  AppService.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import Foundation
import Combine

enum TabItem: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case cart = "cart"
    case liked = "heart"
    case personal = "person"
}

class AppService {
    static let shared = AppService()
    
    private(set) var selectedTab: CurrentValueSubject<TabItem, Never> = .init(.home)
    var showTabBar: CurrentValueSubject<Bool, Never> = .init(true)
    
    private init() {
        
    }
    
    func setSelectedTab(tab: TabItem) {
        self.selectedTab.value = tab
    }
}
