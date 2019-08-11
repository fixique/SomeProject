//
//  AuthPageViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class AuthPageViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let logoSize = CGSize(width: 150.0, height: 150.0)
        static let logoVerticalOffset: CGFloat = -150
        static let emailFieldTopOffset: CGFloat = 30.0
        static let emailFieldBottomOffset: CGFloat = 15.0
    }

    // MARK: - Properties

    var output: AuthPageViewOutput?

    // MARK: - Private Properties

    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private let emailField = RoundInputFieldView()
    private let passwordField = RoundInputFieldView()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - AuthPageViewInput

extension AuthPageViewController: AuthPageViewInput {

    func setupInitialState() {
        configureBackground()
        configureLogo()
        configureInputFields()
    }

}

// MARK: - Configuration

private extension AuthPageViewController {

    func configureBackground() {
        view.backgroundColor = Color.Main.background
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = UIScreen.main.bounds.size
        let scrollViewTopConstraint = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        let scrollViewLeftConstraint = scrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let scrollViewRightConstraint = scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        let scrollViewBottomConstraint = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        NSLayoutConstraint.activate([scrollViewTopConstraint, scrollViewLeftConstraint, scrollViewRightConstraint, scrollViewBottomConstraint])
    }

    func configureLogo() {
        let image = UIImage(asset: Asset.AuthPage.logo)
        imageView.image = image
        scrollView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        let horizontalConstraint = imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        let verticalConstraint = imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: Constants.logoVerticalOffset)
        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: Constants.logoSize.height)
        let widthConstraint = imageView.widthAnchor.constraint(equalToConstant: Constants.logoSize.width)

        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, heightConstraint, widthConstraint])
    }

    func configureInputFields() {
        emailField.configure(placeholder: L10n.Authpage.Inputfield.Email.placeholder, correction: .no, keyboardType: .emailAddress, contentType: .emailAddress)
        passwordField.configure(placeholder: L10n.Authpage.Inputfield.Password.placeholder, correction: .no, keyboardType: .asciiCapable, contentType: .password)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false

        let emailTopConstraint = emailField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.emailFieldTopOffset)
        let emailHorizontalConstraint = emailField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)

        let passwordTopConstraint = passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: Constants.emailFieldBottomOffset)
        let passwordHorizontalConstraint = passwordField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)

        NSLayoutConstraint.activate([emailTopConstraint, emailHorizontalConstraint, passwordTopConstraint, passwordHorizontalConstraint])
    }

}
