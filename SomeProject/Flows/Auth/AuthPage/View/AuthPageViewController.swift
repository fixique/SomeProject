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
        static let buttonSize = CGSize(width: 250.0, height: 30.0)
        static let activeViewOffset: CGFloat = 50
        static let animationDuration: TimeInterval = 0.3
    }

    // MARK: - Properties

    var output: AuthPageViewOutput?

    // MARK: - Private Properties

    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private let emailField = RoundInputFieldView()
    private let passwordField = RoundInputFieldView()
    private let loginButton = UIButton(type: .custom)

    private var activeView: UIView?
    private var keyboardHeight: CGFloat?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeOnKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLayoutSubviews() {
        loginButton.mainPrurpleStyle()
    }

}

// MARK: - AuthPageViewInput

extension AuthPageViewController: AuthPageViewInput {

    func setupInitialState() {
        configureBackground()
        configureLogo()
        configureInputFields()
        configureLoginButton()
        configureCloseKeyboardGesture()
        configureInputHandlers()
    }

}

// MARK: - Configuration

private extension AuthPageViewController {

    func configureBackground() {
        view.backgroundColor = Color.Main.background
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = UIScreen.main.bounds.size
        scrollView.keyboardDismissMode = .onDrag
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
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
        emailField.configure(placeholder: L10n.Authpage.Inputfield.Email.placeholder, correction: .no, keyboardType: .emailAddress, mode: RoundInputFieldView.Mode.email)
        passwordField.configure(placeholder: L10n.Authpage.Inputfield.Password.placeholder, correction: .no, keyboardType: .asciiCapable, mode: RoundInputFieldView.Mode.password)
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

    func configureLoginButton() {
        scrollView.addSubview(loginButton)
        loginButton.mainPrurpleStyle()
        loginButton.setTitle(L10n.Authpage.Buttons.Login.text, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        let topConstraint = loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: Constants.emailFieldBottomOffset)
        let horizantalConstraint = loginButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        let heightConstraint = loginButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height)
        let widthConstraint = loginButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width)

        NSLayoutConstraint.activate([topConstraint, horizantalConstraint, heightConstraint, widthConstraint])
    }

    func configureCloseKeyboardGesture() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        view.addGestureRecognizer(gestureRecognizer)
    }

    func configureInputHandlers() {
        emailField.onBeginEditing = { [weak self] textField in
            self?.activeView = self?.emailField
            self?.scrollToActiveView(Constants.animationDuration)
        }

        passwordField.onBeginEditing = { [weak self] textField in
            self?.activeView = self?.passwordField
            self?.scrollToActiveView(Constants.animationDuration)
        }
    }

}

// MARK: - Actions

private extension AuthPageViewController {

    @objc
    func tapOnView() {
        view.endEditing(true)
    }

}

// MARK: - Keyboard

private extension AuthPageViewController {

    func subscribeOnKeyboardNotifications() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillBeShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc
    func keyboardWillBeShown(notification: Notification) {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        self.keyboardHeight = keyboardFrame.cgRectValue.height
        scrollToActiveView(Constants.animationDuration)
    }

    @objc
    func keyboardWillBeHidden(notification: Notification) {
        resetScrollView(Constants.animationDuration)
        keyboardHeight = nil
    }

    func scrollToActiveView(_ duration: Double) {
        guard let keyboardHeight = self.keyboardHeight, let activeView = self.activeView else {
            return
        }

        let distanceToBottom = scrollView.frame.size.height - (activeView.frame.origin.y + activeView.frame.size.height + Constants.activeViewOffset)
        let collapseSpace = keyboardHeight - distanceToBottom

        if collapseSpace < 0 {
            return
        }

        UIView.animate(withDuration: duration) {
            self.scrollView.contentSize = CGSize(width: self.scrollView.contentSize.width, height: self.scrollView.contentSize.height + keyboardHeight)
            self.scrollView.contentOffset = CGPoint(x: 0, y: collapseSpace)
        }
    }

    func resetScrollView(_ duration: Double) {
        UIView.animate(withDuration: duration) {
            self.scrollView.contentSize = UIScreen.main.bounds.size
        }
    }

}
