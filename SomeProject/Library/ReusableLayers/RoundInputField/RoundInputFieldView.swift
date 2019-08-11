//
//  RoundInputFieldView.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class RoundInputFieldView: UIView {

    // MARK: - Enum

    enum Mode {
        case email
        case password

        var contentType: UITextContentType {
            switch self {
            case .email:
                return .emailAddress
            case .password:
                return .password
            }
        }
    }

    // MARK: - Constants

    private enum Constants {
        static let fieldHeight: CGFloat = 30.0
        static let intrinsicSize = CGSize(width: 250.0, height: 39.0)
        static let errorLabelTopSpace: CGFloat = 5.0
        static let errorLabelLeftSpace: CGFloat = 14.0
    }

    // MARK: - Public Properties

    var onBeginEditing: ((UITextField) -> Void)?
    var onEndEditing: ((UITextField) -> Void)?
    var onShouldReturn: ((UITextField) -> Void)?
    var responder: UIResponder {
        return self.inputField
    }
    var validator: TextFieldValidation?
    var nextInput: UIResponder?

    // MARK: - Private Properties

    private let inputField: RoundInputField = RoundInputField()
    private let errorLabel: UILabel = UILabel()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialState()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInitialState()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

    // MARK: - UIView

    override var intrinsicContentSize: CGSize {
        return Constants.intrinsicSize
    }

    // MARK: - Internal Methods

    func configure(placeholder: String?, correction: UITextAutocorrectionType, keyboardType: UIKeyboardType, mode: RoundInputFieldView.Mode) {
        inputField.placeholder = placeholder
        inputField.autocorrectionType = correction
        inputField.keyboardType = keyboardType
        inputField.textContentType = mode.contentType
        inputField.isSecureTextEntry = mode == .password
    }

}

// MARK: - Configuration

private extension RoundInputFieldView {

    func setupInitialState() {
        configureErrorLabel()
        configureInputField()
        configureConstraints()
    }

    func configureErrorLabel() {
        errorLabel.alpha = 1.0
        errorLabel.font = .systemFont(ofSize: 10.0, weight: .regular)
        errorLabel.textColor = Color.InputFields.RoundInputField.error
        errorLabel.text = "Test string"
        addSubview(errorLabel)
    }

    func configureInputField() {
        inputField.delegate = self
        addSubview(inputField)
    }

    func configureConstraints() {
        inputField.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        let topFieldConstraint = inputField.topAnchor.constraint(equalTo: self.topAnchor)
        let leftFieldConstraint = inputField.leftAnchor.constraint(equalTo: self.leftAnchor)
        let rightFieldConstraint = inputField.rightAnchor.constraint(equalTo: self.rightAnchor)
        let heightFieldConstraint = inputField.heightAnchor.constraint(equalToConstant: Constants.fieldHeight)

        let topErrorLabelConstraint = errorLabel.topAnchor.constraint(equalTo: inputField.bottomAnchor, constant: Constants.errorLabelTopSpace)
        let leftErrorLabelConstraint = errorLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.errorLabelLeftSpace)
        let rightErrorLabelConstraint = errorLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        let bottomErrorLabelConstraint = errorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        NSLayoutConstraint.activate([topFieldConstraint,
                                     leftFieldConstraint,
                                     rightFieldConstraint,
                                     heightFieldConstraint,
                                     topErrorLabelConstraint,
                                     leftErrorLabelConstraint,
                                     rightErrorLabelConstraint,
                                     bottomErrorLabelConstraint])
    }

}

// MARK: - UITextFieldDelegate

extension RoundInputFieldView: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        onBeginEditing?(textField)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
//        validate()
        onEndEditing?(textField)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = nextInput {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            onShouldReturn?(textField)
            return true
        }
        return false
    }

}
