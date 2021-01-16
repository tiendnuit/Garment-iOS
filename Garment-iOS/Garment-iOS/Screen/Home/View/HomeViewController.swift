//
//  HomeViewController.swift
//  Garment-iOS
//
//  Created by Scor Doan on 14/01/2021.
//

import Foundation
import UIKit
import Combine
import RealmSwift

class HomeViewController: UIViewController, UIViewControllerConfigurable, Storyboarded {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    private var dataSource: ListGarmentDataSource!
    var viewModel: HomeViewModel = HomeViewModel()
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        bindViewModel()
        updateUI()
    }
    
    
    func setupComponents() {
        title = "List"
        view.backgroundColor = UIColor.assetColor(.primaryBackground)
        dataSource = ListGarmentDataSource(delegate: viewModel)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.register(GarmentTableViewCell.self,
                           forCellReuseIdentifier: GarmentTableViewCell.defaultIdentifier)

    }

    func bindViewModel() {
        func bindViewModelToView() {
            let reloadTableHandler: ([Any]) -> Void = { [weak self] _ in
                self?.tableView.reloadData()
            }

            viewModel.$garments
                .receive(on: RunLoop.main)
                .sink(receiveValue: reloadTableHandler)
                .store(in: &bindings)

            let stateHandler: (ViewModelState) -> Void = { state in
                switch state {
                case .loading:
                    print("loading....")
                case .error(let error):
                    print("error....\(error)")
                default:
                    print("stop....")
                }
            }

            viewModel.$state
                .receive(on: RunLoop.main)
                .sink(receiveValue: stateHandler)
                .store(in: &bindings)
        }

        bindViewModelToView()
        viewModel.fetchData()
    }
    
    func updateUI() {
    }
    
    //MARK: -- Event methods
    @IBAction func segmentValueChanged(_ sender: Any) {
        viewModel.sorted = GarmentSortedType(rawValue: segmentControl.selectedSegmentIndex) ?? .alphabet
        tableView.reloadData()
    }
}
