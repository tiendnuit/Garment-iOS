//
//  AddNewGarmentCoordinator.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation
import UIKit
import Combine

protocol AddNewGarmentCoordinatorDelegate: class {
    func requestDismissal()
}

class AddNewGarmentCoordinator: Coordinator {
    var navigationController: UINavigationController
    private var bindings = Set<AnyCancellable>()
    
    weak var coordinatorDelegate: AddNewGarmentCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = AddNewGarmentViewModel()
        viewModel.$dismissed
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] dismissed in
                if dismissed {
                    self?.coordinatorDelegate?.requestDismissal()
                }
            })
            .store(in: &bindings)
        
        let vc = AddNewGarmentViewController()
        vc.viewModel = viewModel
        
        navigationController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
}
