//
//  HomeViewModel.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var newArrivalsProducts: [Product] = []
    
    let numberOfColumnsForArrivalProducts: Int = 2
    let numberOfRowsForArrivalProducts: Int = 2
    
    init() {
        
        let numberOfArrivalProducts = numberOfRowsForArrivalProducts * numberOfColumnsForArrivalProducts
        self.newArrivalsProducts = MockedAPI.shared.getArrivalsProducts(numberOfElements: numberOfArrivalProducts)
    }
}
