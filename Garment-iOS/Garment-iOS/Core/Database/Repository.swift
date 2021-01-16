//
//  Repository.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation

protocol Repository {
    associatedtype EntityObject: Entity
    
    func fetch(where predicate: NSPredicate?) -> [EntityObject]
    func insert(item: EntityObject) throws
}

extension Repository {
    func fetchAll() -> [EntityObject] {
        return fetch(where: nil)
    }
}
