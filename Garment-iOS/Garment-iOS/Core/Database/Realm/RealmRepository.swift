//
//  RealmRepository.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation
import RealmSwift

/// Implementation of the Repository in Realm database
class RealmRepository<RepoObject>: Repository
                                where RepoObject: Entity,
                                      RepoObject.StoreType: Object {
    
    typealias RealmObject = RepoObject.StoreType
    private let realm: Realm

    init() {
        realm = try! Realm()
    }

    
    func fetch(where predicate: NSPredicate?) -> [RepoObject] {
        var objects = realm.objects(RealmObject.self)

        if let predicate = predicate {
            objects = objects.filter(predicate)
        }
        return objects.compactMap{ ($0).model as? RepoObject }
    }

    func insert(item: RepoObject) throws {
        try realm.write {
            realm.add(item.toStorable(), update: .all)
        }
    }
    
}
