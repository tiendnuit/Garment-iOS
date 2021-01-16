//
//  GarmentTableViewCell.swift
//  Garment-iOS
//
//  Created by Scor Doan on 14/01/2021.
//

import Foundation
import UIKit

class GarmentTableViewCell: UITableViewCell, Configurable, GarmentViewPresentable {
    var nameLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.assetColor(.textLabel)
        label.font = UIFont.body
        return label
    }()
    
    var dateLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.assetColor(.subTextLabel)
        label.font = UIFont.subText
        return label
    }()
    
    var bottomLine: UIImageView! = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.assetColor(.separatedLineGray)
        return image
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = CGFloat.defaultComponentsSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetup()
    }
    
    func initSetup() {
        backgroundColor = .clear
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(dateLabel)
        contentView.addSubview(contentStackView)
        contentView.addSubview(bottomLine)
        //Update constraints
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomLine.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat.defaultSpacing),
            contentStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            contentStackView.heightAnchor.constraint(equalToConstant: CGFloat.defaultCellHeight),
            bottomLine.heightAnchor.constraint(equalToConstant: CGFloat.bottomLineHeight),
            bottomLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat.defaultSpacing),
            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(_ item: Any) {
        map(item: item as? GarmentPresentable)
    }
    
    
}
