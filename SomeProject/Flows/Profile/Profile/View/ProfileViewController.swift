//
//  RandomImagesViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Properties

    var output: ProfileViewOutput?

    // MARK: - Private Properties

    private let tableView = UITableView()
    private var adapter: ProfileAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - ProfileViewInput

extension ProfileViewController: ProfileViewInput {

    func setupInitialState(with model: ProfileViewModel) {
        configureBackground()
        configureNavigationBar()
        configureTableView()
        adapter?.configure(with: model)
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

    func configureTableView() {
        adapter = ProfileAdapter(with: tableView)
        tableView.dataSource = adapter
        view.addSubview(tableView)
        tableView.fillSuperview()

        adapter?.logoutClosure = { [weak self] in
            self?.output?.logout()
        }
    }

}
