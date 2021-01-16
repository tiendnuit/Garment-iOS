//
//  HomeViewModel.swift
//  Garment-iOS
//
//  Created by Scor Doan on 14/01/2021.
//

import Foundation
import Combine


enum ViewModelState {
    case none
    case stop
    case loading
    case error(Error)
}

enum GarmentSortedType: Int {
    case alphabet = 0, createdDate
}

class HomeViewModel {
    @Published private(set) var garments: [Garment] = []
    @Published private(set) var state: ViewModelState = .none
    @Published var sorted: GarmentSortedType = .alphabet

    private let repository: RealmRepository<Garment>

    init(repository: RealmRepository<Garment> = RealmRepository()) {
        self.repository = repository
    }
    
    //MARK: - Public functions
    func fetchData() {
        garments = repository.fetchAll()
    }

    //MARK: - Private functions
    private func reset() {
        state = .stop
        garments = []
    }
}

//MARK:
extension HomeViewModel: ListGarmentProtocol {
    var items: [GarmentPresentable] {
        if sorted == .alphabet {
            return garments.sorted(by: {$0.name < $1.name})
        }
        return garments.sorted(by: {$0.createdDate > $1.createdDate})
    }
    
}
