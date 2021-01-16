//
//  StorableGarment.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation
import RealmSwift

class StorableGarment: Object, Storable {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var createdDate: Date = Date()
    
    var model: Garment {
        get {
            return Garment(name: name, createdDate: createdDate)
        }
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
