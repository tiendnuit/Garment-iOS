//
//  ListGarmentProtocol.swift
//  Garment-iOS
//
//  Created by Scor Doan on 14/01/2021.
//

import Foundation

///These functions adopted by the object that manage the Garment data for tableview
protocol ListGarmentProtocol: class {
    var items: [GarmentPresentable] {get}
    func numberOfItems() -> Int
    func item(at indexPath: IndexPath) -> GarmentPresentable?
    func itemSelected(at: IndexPath)
}

extension ListGarmentProtocol {
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(at indexPath: IndexPath) -> GarmentPresentable? {
        guard indexPath.row < items.count else { return nil }
        return items[indexPath.row]
    }
    
    func itemSelected(at indexPath: IndexPath) {
        guard let _ = item(at: indexPath) else { return }
    }
}
