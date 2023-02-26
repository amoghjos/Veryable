//
//  AccountListTableViewCell.swift
//  Veryable Sample
//
//  Created by Amogh Joshi on 2/22/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit

class AccountListTableViewCell: UITableViewCell {
    
    private lazy var horizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
        return stackView
    }()
    
    private lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = VBlue.normal.color
        imageView.image = UIImage(named: "card")?.withRenderingMode(.alwaysTemplate)
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    //MARK: Init Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpHorizontalStackView()
    }
    
    private func setUpHorizontalStackView() {
        addSubview(horizontalStack)
        NSLayoutConstraint.activate([
            horizontalStack.leftAnchor.constraint(equalTo: leftAnchor),
            horizontalStack.rightAnchor.constraint(equalTo: rightAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStack.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    private func setUpVerticalStackView() {
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
