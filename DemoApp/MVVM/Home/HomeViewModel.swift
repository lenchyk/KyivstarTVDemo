//
//  HomeViewModel.swift
//  DemoApp
//
//  Created by Lena Soroka on 19.11.2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    weak var coordinator : AppCoordinator?
    private var cancellableSet: Set<AnyCancellable> = []
    
    @Published var promotions: Promotions = .fakeItem
    
    func goToDetails(){
        coordinator?.goToAssetDetails()
    }
    
    func fetchPromotions() {
        PromotionsAPIClient()
            .getPromotions()
            .assign(to: \.promotions, on: self)
            .store(in: &cancellableSet)
    }
}
