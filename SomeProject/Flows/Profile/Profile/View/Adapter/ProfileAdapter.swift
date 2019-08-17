//
//  ProfileAdapter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class ProfileAdapter: NSObject {

    // MARK: – Enums

    private enum Cells: Int {
        case header
        case logout
    }

    // MARK: – Constants

    private enum Constants {
        static let cellsCount: Int = 2
    }

    // MARK: - Properties

    var logoutClosure: EmptyClosure?

    // MARK: - Private Properties

    private let tableView: UITableView
    private var model: ProfileViewModel?

    // MARK: - Initialization

    init(with tableView: UITableView) {
        tableView.registerCell(ProfileHeaderCell.self)
        tableView.registerCell(ProfileLogoutCell.self)
        tableView.separatorStyle = .none
        self.tableView = tableView
    }

    // MARK: - Internal Methods

    func configure(with model: ProfileViewModel) {
        self.model = model
        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension ProfileAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.cellsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = Cells(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        switch cellType {
        case .header:
            return configureHeaderCell(tableView, indexPath: indexPath)
        case .logout:
            return configureLogoutCell(tableView, indexPath: indexPath)
        }

    }

}

// MARK: - UITableViewDelegate

extension ProfileAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellType = Cells(rawValue: indexPath.row) else {
            return 0.0
        }
        switch cellType {
        case .header:
            return ProfileHeaderCell.height()
        case .logout:
            return ProfileLogoutCell.height()
        }
    }

}

// MARK: - Configure Cells

private extension ProfileAdapter {

    func configureHeaderCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let profileHeader = tableView.dequeueReusableCell(withIdentifier: ProfileHeaderCell.nameOfClass, for: indexPath) as? ProfileHeaderCell else {
            return UITableViewCell()
        }
        profileHeader.configure(avatarPath: model?.userAvatar, email: model?.userEmail)
        return profileHeader
    }

    func configureLogoutCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let logoutCell = tableView.dequeueReusableCell(withIdentifier: ProfileLogoutCell.nameOfClass, for: indexPath) as? ProfileLogoutCell else {
            return UITableViewCell()
        }
        logoutCell.logoutClosure = { [weak self] in
            self?.logoutClosure?()
        }
        return logoutCell
    }

}
