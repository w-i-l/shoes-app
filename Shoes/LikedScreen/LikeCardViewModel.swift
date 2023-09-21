//
//  LikeCardViewModel.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import SwiftUI

class LikedCardViewModel: BaseViewModel {
    @Published var likedProducts: [Product] = []
    
    static let shared = LikedCardViewModel()
    
    private override init() {
        super.init()
        
        LikedService.shared.likedProducts
            .receive(on: DispatchQueue.main)
            .sink { [weak self] likedProducts in
                self?.likedProducts = likedProducts
            }
            .store(in: &self.bag)
    }
    
    func removeLikedProduct(productID: String) {
        LikedService.shared.removeLikedProduct(productID: productID)
    }
}
