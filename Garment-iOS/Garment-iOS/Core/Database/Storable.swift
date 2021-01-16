//
//  File.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation

public protocol Storable {
    associatedtype EntityObject: Entity
    
    var model: EntityObject { get }
    var id: String { get }
}
