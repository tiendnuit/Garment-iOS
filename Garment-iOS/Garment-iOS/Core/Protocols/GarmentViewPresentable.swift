//
//  GarmentViewPresentable.swift
//  Garment-iOS
//
//  Created by Scor Doan on 14/01/2021.
//

import Foundation
import UIKit

protocol GarmentViewPresentable {
    var nameLabel: UILabel! {get set}
    var dateLabel: UILabel! {get set}
}

extension GarmentViewPresentable {
    func map(item: GarmentPresentable?) {
        guard let item = item else { return }
        nameLabel.text = item.nameText
        dateLabel.text = item.createdTimeAgo
    }
}
