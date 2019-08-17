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
        static let avatarTopOffset: CGFloat = 30.0
        static let avatarStroke: CGFloat = 1.0
        static let emailEdges = UIEdgeInsets(top: 20.0, left: 16.0, bottom: 15.0, right: -16.0)
        static let cellHeight: CGFloat = 189.0
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

    // MARK: - Class Methods

    class func height() -> CGFloat {
        return Constants.cellHeight
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
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.cornerRadius = Constants.avatarSize.height / 2
        avatarImageView.layer.borderWidth = Constants.avatarStroke
        avatarImageView.layer.borderColor = Color.Main.stroke.cgColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.backgroundColor = Color.Main.background
        addSubview(avatarImageView)

        let avatarTopConstraint = avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.avatarTopOffset)
        let avatarHorizontalConstraint = avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        let avatarHeightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarSize.height)
        let avatarWidthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: Constants.avatarSize.width)

        NSLayoutConstraint.activate([avatarTopConstraint, avatarHorizontalConstraint, avatarHeightConstraint, avatarWidthConstraint])
    }

    func configureEmailLabel() {
        emailLabel.textColor = Color.Main.text
        emailLabel.font = .systemFont(ofSize: 20.0, weight: .semibold)
        emailLabel.textAlignment = .center
        emailLabel.text = nil
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emailLabel)

        let emailTopConstraint = emailLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Constants.emailEdges.top)
        let emailLeftConstraint = emailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.emailEdges.left)
        let emailRightConstraint = emailLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.emailEdges.right)

        NSLayoutConstraint.activate([emailTopConstraint, emailLeftConstraint, emailRightConstraint])
    }

}
