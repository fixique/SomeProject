//
//  ProfileLogoutCell.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class ProfileLogoutCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let buttonTopOffset: CGFloat = 15.0
        static let buttonSize = CGSize(width: 250.0, height: 30.0)
        static let cellHeight: CGFloat = 60.0
    }

    // MARK: - Properties

    var logoutClosure: EmptyClosure?

    // MARK: - Private Properties

    private let logoutButton = UIButton(type: .custom)

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitialState()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInitialState()
    }

    // MARK: - UITableViewCell

    override func layoutSubviews() {
        logoutButton.mainPrurpleStyle()
    }

    // MARK: - Class Methods

    class func height() -> CGFloat {
        return Constants.cellHeight
    }

}

// MARK: - Configuration

private extension ProfileLogoutCell {

    func setupInitialState() {
        selectionStyle = .none
        configureLogoutButton()
    }

    func configureLogoutButton() {
        addSubview(logoutButton)
        logoutButton.setTitle(L10n.Profile.Buttons.Logout.title, for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)

        let topConstraint = logoutButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.buttonTopOffset)
        let horizantalConstraint = logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        let heightConstraint = logoutButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height)
        let widthConstraint = logoutButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width)

        NSLayoutConstraint.activate([topConstraint, horizantalConstraint, heightConstraint, widthConstraint])
    }

}

// MARK: - Actions

private extension ProfileLogoutCell {

    @objc
    func logoutButtonPressed() {
        logoutClosure?()
    }

}
