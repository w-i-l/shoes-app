//
//  LikedViewModel.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import SwiftUI

class LikedViewModel: BaseViewModel {
    @Published var likedProducts: [Product] = []
    
    override init() {
        
        super.init()
        
        LikedService.shared.likedProducts
            .receive(on: DispatchQueue.main)
            .sink { [weak self] likedProducts in
                self?.likedProducts = likedProducts
            }
            .store(in: &self.bag)
    }
    
    func removeAllLikedProducts() {
        LikedService.shared.likedProducts.value = []
    }
}
