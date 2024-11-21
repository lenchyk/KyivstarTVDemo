//
//  AppCoordinator.swift
//  DemoApp
//
//  Created by Lena Soroka on 18.11.2024.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("Starting App Coordinator")
        goToHome()
    }
    
    private func goToHome() {
        let homeVC = HomeViewController()
        let homeViewModel = HomeViewModel()
        homeViewModel.coordinator = self
        homeVC.viewModel = homeViewModel
        navigationController.pushViewController(homeVC, animated: true)
        navigationController.isNavigationBarHidden = true
    }
    
    func goToAssetDetails() {
        // TODO: - asset details page
    }
}
