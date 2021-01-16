//
//  Garment.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation

struct Garment: Codable {
    let name: String
    let createdDate: Date
}

extension Garment: Entity {
    func toStorable() -> StorableGarment {
        let object = StorableGarment()
        object.name = name
        object.id = name
        object.createdDate = createdDate
        return object
    }
}

//MARK: - GarmentPresentable
extension Garment: GarmentPresentable {
    var nameText: String {
        return name
    }
    
    var createdTimeAgo: String {
        return createdDate.distanceTimeString(toDate: Date()) ?? ""
    }
}
