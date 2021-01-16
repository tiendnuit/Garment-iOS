//
//  AddNewGarmentViewModel.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation
import Combine

class AddNewGarmentViewModel {
    @Published private(set) var state: ViewModelState = .none
    @Published private(set) var dismissed: Bool = false
    
    private let repository: RealmRepository<Garment>

    init(repository: RealmRepository<Garment> = RealmRepository()) {
        self.repository = repository
    }
    
    func save(_ item: Garment) {
        do {
            try repository.insert(item: item)
            state = .stop
            dismissed = true
        } catch {
            state = .error(error)
        }
    }
}
