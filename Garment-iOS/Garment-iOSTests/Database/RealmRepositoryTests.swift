//
//  RealmRepositoryTests.swift
//  Garment-iOSTests
//
//  Created by Scor Doan on 15/01/2021.
//

import XCTest
import RealmSwift
@testable import Garment_iOS
class RealmRepositoryTests: XCTestCase {
    private func repository() -> RealmRepository<Garment> {
        return RealmRepository()
    }
    
    override func setUp() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }
    
    func test_add_new_item_count_1() {
        //Given
        let count = 1
        let item = Garment(name: "Hat", createdDate: Date())
        
        //When
        try! repository().insert(item: item)
        let items = repository().fetchAll()
        
        //Then
        XCTAssertEqual(count, items.count)
    }
    
    func test_add_new_item() {
        //Given
        let item = Garment(name: "Hat", createdDate: Date())
        
        //When
        try! repository().insert(item: item)
        let first = repository().fetchAll()
        
        //Then
        XCTAssertEqual(item.name, first.first!.name)
    }
    
    func test_fetchAll_item_count_3() {
        //Given
        let count = 3
        let item1 = Garment(name: "Hat", createdDate: Date())
        let item2 = Garment(name: "Hat", createdDate: Date())
        let item3 = Garment(name: "Hat", createdDate: Date())
        
        //When
        try! repository().insert(item: item1)
        try! repository().insert(item: item2)
        try! repository().insert(item: item3)
        let items = repository().fetchAll()
        
        //Then
        XCTAssertEqual(count, items.count)
    }
 
}
