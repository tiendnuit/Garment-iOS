//
//  AddNewGarmentViewController.swift
//  Garment-iOS
//
//  Created by Scor Doan on 15/01/2021.
//

import Foundation
import UIKit
import Combine

class AddNewGarmentViewController: UIViewController, UIViewControllerConfigurable {
    let nameLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.assetColor(.textLabel)
        label.text = "Garment Name:"
        label.font = UIFont.title
        return label
    }()
    
    let textField: UITextField! = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .roundedRect
        tf.placeholder = "Input Garment Name"
        return tf
    }()
    
    var viewModel = AddNewGarmentViewModel()
    private var bindings = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        constraintsInit()
        bindViewModel()
        updateUI()
    }
    
    func setupComponents() {
        title = "ADD"
        view.backgroundColor = UIColor.assetColor(.primaryBackground)
        view.addSubview(nameLabel)
        view.addSubview(textField)
        
        addCloseButton()
        addSaveButton()
    }
    
    func addSaveButton() {
        let saveButtonItem = UIBarButtonItem(title: "Save",
                                              style: .plain,
                                              target: self,
                                              action: #selector(saveItem))
        navigationItem.rightBarButtonItem = saveButtonItem
    }
    
    func constraintsInit() {
        //Constraints
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat.defaultSpacing),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.defaultSpacing),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -CGFloat.defaultComponentsSpacing),
            textField.heightAnchor.constraint(equalToConstant: CGFloat.textFieldHeight),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.defaultSpacing)
        ])
    }
    
    func bindViewModel() {
        func bindViewModelToView() {
            let stateHandler: (ViewModelState) -> Void = { [weak self] state in
                switch state {
                case .loading:
                    print("loading....")
                case .stop:
                    print("stop....")
                    self?.dismiss()
                case .error(let error):
                    print("error....\(error)")
                default:
                    print("none")
                }
            }

            viewModel.$state
                .receive(on: RunLoop.main)
                .sink(receiveValue: stateHandler)
                .store(in: &bindings)
        }

        bindViewModelToView()
    }
    
    func updateUI() {
        
    }
    
    @objc private func saveItem() {
        guard let name = textField.text, !name.isEmpty else { return }
        viewModel.save(Garment(name: name, createdDate: Date()))
    }
}
