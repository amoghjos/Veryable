//
//  AccountDetailViewController.swift
//  Veryable Sample
//
//  Created by Amogh Joshi on 2/26/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit

class AccountDetailViewController: UIViewController {
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .vryAvenirNextDemiBold(16)
        label.textColor = VBlack.normal.color
        label.text = "WF Checking Account"
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .vryAvenirNextRegular(14)
        label.textColor = VGrey.normal.color
        label.text = "Wells Fargo x2355"
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("DONE", for: .normal)
        button.addTarget(self, action: #selector(goBackToAccountListViewController), for: .touchUpInside)
        button.backgroundColor = VBlue.normal.color
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    override func viewDidLoad() {
        title = "DETAILS"
        view.backgroundColor = ViewColor.background.color
        setUpCustomBackButton()
        setUpVerticalStackView()
        setUpButton()
    }
    
    init(with account: Account) {
        super.init(nibName: nil, bundle: nil)
        setUpUserInterfaceDetails(with: account)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpUserInterfaceDetails(with account: Account) {
        titleLabel.text = account.accountName
        subTitleLabel.text = account.description
        if account.accountType == AccountType.bank.rawValue {
            imageView.image = UIImage(named: "bank")?.withRenderingMode(.alwaysTemplate)
        } else {
            imageView.image = UIImage(named: "card")?.withRenderingMode(.alwaysTemplate)
        }
        imageView.tintColor = VBlue.normal.color
    }
    
    //MARK: Back Button
    private func setUpCustomBackButton() {
        guard let arrowImage = UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate) else { return }
        let backButtonImage = arrowImage.withHorizontallyFlippedOrientation()
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        backButton.addTarget(self, action: #selector(goBackToAccountListViewController), for: .touchUpInside)
        backButton.tintColor = .black
        backButton.setBackgroundImage(backButtonImage, for: .normal)
        let customBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBarButtonItem
    }
    
    @objc func goBackToAccountListViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: Vertical Stack View
    private func setUpVerticalStackView() {
        view.addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            verticalStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
        verticalStackView.addArrangedSubview(imageView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subTitleLabel)
    }
    
    //MARK: Done Button
    private func setUpButton() {
        view.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15),
            doneButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15),
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
}
