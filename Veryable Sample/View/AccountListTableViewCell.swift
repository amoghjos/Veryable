//
//  AccountListTableViewCell.swift
//  Veryable Sample
//
//  Created by Amogh Joshi on 2/22/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit

class AccountListTableViewCell: UITableViewCell {
    
    //seperator view
    private lazy var bottomSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = VGrey.normal.color
        return view
    }()
    
    //horizontal stack view
    private lazy var horizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = VBlue.normal.color
        imageView.image = UIImage(named: "card")?.withRenderingMode(.alwaysTemplate)
        let heightConstrain = imageView.heightAnchor.constraint(equalToConstant: 30)
        heightConstrain.priority = UILayoutPriority(10)
        heightConstrain.isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        return imageView
    }()
    
    private lazy var rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = VGrey.normal.color
        imageView.image = UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate)
        let heightConstrain = imageView.heightAnchor.constraint(equalToConstant: 30)
        heightConstrain.priority = UILayoutPriority(10)
        heightConstrain.isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // vertical stack view
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var accountTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .vryAvenirNextDemiBold(14)
        label.textColor = VBlack.normal.color
        label.text = "Headline"
        return label
    }()
    
    private lazy var accountInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .vryAvenirNextRegular(12)
        label.textColor = VBlack.normal.color
        label.text = "Subheadline"
        return label
    }()
    
    private lazy var transactionInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .vryAvenirNextRegular(12)
        label.textColor = VGrey.normal.color
        label.text = "Transaction Details"
        return label
    }()
    
    //MARK: Init Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpBottomSeperatorView()
        setUpHorizontalStackView()
        setUpVerticalStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Setup UI Elements
    private func setUpBottomSeperatorView() {
        addSubview(bottomSeperatorView)
        NSLayoutConstraint.activate([
            bottomSeperatorView.leftAnchor.constraint(equalTo: leftAnchor),
            bottomSeperatorView.rightAnchor.constraint(equalTo: rightAnchor),
            bottomSeperatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomSeperatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setUpHorizontalStackView() {
        addSubview(horizontalStack)
        NSLayoutConstraint.activate([
            horizontalStack.leftAnchor.constraint(equalTo: leftAnchor),
            horizontalStack.rightAnchor.constraint(equalTo: rightAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomSeperatorView.topAnchor),
            horizontalStack.topAnchor.constraint(equalTo: topAnchor)
        ])
        horizontalStack.addArrangedSubview(leftImageView)
        horizontalStack.addArrangedSubview(verticalStackView)
        horizontalStack.addArrangedSubview(rightImageView)
    }
    
    private func setUpVerticalStackView() {
        verticalStackView.addArrangedSubview(accountTypeLabel)
        verticalStackView.addArrangedSubview(accountInfoLabel)
        verticalStackView.addArrangedSubview(transactionInfoLabel)
    }
}
