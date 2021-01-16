//
//  ViewReusable.swift
//  Garment-iOS
//
//  Created by Scor Doan on 14/01/2021.
//

import Foundation
import UIKit

protocol ViewReusable: class {
    static var defaultIdentifier: String { get }
}

extension ViewReusable where Self: UIView {
    static var defaultIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ViewReusable {
}
