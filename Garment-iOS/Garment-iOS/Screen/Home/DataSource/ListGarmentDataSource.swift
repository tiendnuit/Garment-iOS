//
//  ListGarmentDataSource.swift
//  Garment-iOS
//
//  Created by Scor Doan on 14/01/2021.
//

import Foundation
import UIKit

class ListGarmentDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    weak var delegate: ListGarmentProtocol?
    
    init(delegate: ListGarmentProtocol?) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.numberOfItems() ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = delegate?.item(at: indexPath) else {
            fatalError("Item is not exists")
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GarmentTableViewCell.defaultIdentifier, for: indexPath) as? GarmentTableViewCell else {
            fatalError("Cell is not exists")
        }
        cell.selectionStyle = .none
        cell.configure(item)
        return cell
    }
    
    
}
