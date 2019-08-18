//
//  ProfileHeaderCell.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class ProfileHeaderCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let avatarSize = CGSize(width: 100.0, height: 100.0)
        static let avatarImagePadding = UIEdgeInsets(top: 30.0, left: 0.0, bottom: 0.0, right: 0.0)
        static let avatarStroke: CGFloat = 1.0
        static let emailEdges = UIEdgeInsets(top: 20.0, left: 16.0, bottom: 15.0, right: 16.0)
    }

    // MARK: - Private Properties

    private let avatarImageView = UIImageView()
    private let emailLabel = UILabel()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitialState()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInitialState()
    }

    // MARK: - Internal Methods

    func configure(avatarPath: String?, email: String?) {
        avatarImageView.downloadImage(urlPath: avatarPath)
        emailLabel.text = email
    }

}

// MARK: - Configuration

private extension ProfileHeaderCell {

    func setupInitialState() {
        selectionStyle = .none
        configureAvatar()
        configureEmailLabel()
    }

    func configureAvatar() {
        avatarImageView.layer.cornerRadius = Constants.avatarSize.height / 2
        avatarImageView.layer.borderWidth = Constants.avatarStroke
        avatarImageView.layer.borderColor = Color.Main.stroke.cgColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.backgroundColor = Color.Main.background
        contentView.addSubview(avatarImageView)

        avatarImageView.anchor(top: contentView.topAnchor, padding: Constants.avatarImagePadding, size: Constants.avatarSize)
        avatarImageView.anchorCenter(centerX: contentView.centerXAnchor)
    }

    func configureEmailLabel() {
        emailLabel.textColor = Color.Main.text
        emailLabel.font = .systemFont(ofSize: 20.0, weight: .semibold)
        emailLabel.textAlignment = .center
        emailLabel.text = nil
        contentView.addSubview(emailLabel)

        emailLabel.anchor(top: avatarImageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: Constants.emailEdges)
    }

}
