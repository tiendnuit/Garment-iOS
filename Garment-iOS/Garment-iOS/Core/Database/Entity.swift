//
//  Entity.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation

public protocol Entity {
    associatedtype StoreType: Storable
    
    func toStorable() -> StoreType
}

