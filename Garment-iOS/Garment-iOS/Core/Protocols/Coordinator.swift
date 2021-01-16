//
//  Coordinator.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
