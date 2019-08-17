//
//  RandomImagesViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let buttonSize = CGSize(width: 250.0, height: 30.0)
    }

    // MARK: - Properties

    var output: ProfileViewOutput?

    // MARK: - Private Properties

    private let logoutButton = UIButton(type: .custom)

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func viewDidLayoutSubviews() {
        logoutButton.mainPrurpleStyle()
    }

}

// MARK: - ProfileViewInput

extension ProfileViewController: ProfileViewInput {

    func setupInitialState() {
        configureBackground()
        configureNavigationBar()
        configureLogoutButton()
    }

}

// MARK: - Configuration

private extension ProfileViewController {

    func configureBackground() {
        view.backgroundColor = Color.Main.background
    }

    func configureNavigationBar() {
        navigationController?.applyWhiteNavigationBarStyle()
        title = L10n.Profile.Navbar.title
    }

    func configureLogoutButton() {
        view.addSubview(logoutButton)
        logoutButton.setTitle(L10n.Profile.Buttons.Logout.title, for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)

        let verticalConstraint = logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let horizantalConstraint = logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let heightConstraint = logoutButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height)
        let widthConstraint = logoutButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width)

        NSLayoutConstraint.activate([verticalConstraint, horizantalConstraint, heightConstraint, widthConstraint])
    }

}

// MARK: - Actions

private extension ProfileViewController {

    @objc
    func logoutButtonPressed() {
        output?.logout()
    }

}
