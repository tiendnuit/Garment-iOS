//
//  AppCoordinator.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation
import UIKit
import Combine

class AppCoordinator: Coordinator {
    private var window: UIWindow?
    private var homeViewModel: HomeViewModel?
    
    var navigationController = UINavigationController()
    var childCoordinator: Coordinator? = nil
    
    init(_ window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        showHomePage()
    }
    
    func showHomePage() {
        let viewModel = HomeViewModel()
        let homePage = HomeViewController.instantiate(of: .main)
        homePage.viewModel = viewModel
        homeViewModel = viewModel
        let closeButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon-add") .withRenderingMode(.alwaysOriginal),
                                              style: .plain,
                                              target: self,
                                              action: #selector(addNewGarment))
        homePage.navigationItem.rightBarButtonItem = closeButtonItem
        
        navigationController.viewControllers = [homePage]
    }
    
    @objc func addNewGarment() {
        let addNewCoordinator = AddNewGarmentCoordinator(navigationController: navigationController)
        addNewCoordinator.coordinatorDelegate = self
        childCoordinator = addNewCoordinator
        addNewCoordinator.start()
    }
}

//MARK: - AddNewGarmentCoordinatorDelegate
extension AppCoordinator: AddNewGarmentCoordinatorDelegate {
    func requestDismissal() {
        navigationController.dismiss(animated: true)
        childCoordinator = nil
        homeViewModel?.fetchData()
    }
    
    
}
