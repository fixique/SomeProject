//
//  ProfileAdapter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class ProfileAdapter: NSObject {

    // MARK: - Private Properties

    private let tableView: UITableView
    private var model: ProfileViewModel?

    // MARK: - Initialization

    init(with tableView: UITableView) {
        tableView.registerCell(ProfileHeaderCell.self)
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
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileHeader = tableView.dequeueReusableCell(withIdentifier: ProfileHeaderCell.nameOfClass, for: indexPath) as? ProfileHeaderCell else {
            return UITableViewCell()
        }
        profileHeader.configure(avatarPath: model?.userAvatar, email: model?.userEmail)
        return profileHeader
    }

}

// MARK: - UITableViewDelegate

extension ProfileAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProfileHeaderCell.height()
    }

}
