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
        static let fieldSize = CGSize(width: 250, height: 30.0)
        static let intrinsicSize = CGSize(width: 250.0, height: 39.0)
        static let errorLabelTopSpace: CGFloat = 5.0
        static let errorLabelLeftSpace: CGFloat = 14.0

        static let fieldStrokeWidth: CGFloat = 1.0
        static let fieldMargin: UIEdgeInsets = UIEdgeInsets(top: -8, left: 14, bottom: 8, right: 14)
    }

    // MARK: - Public Properties

    var onBeginEditing: ((UITextField) -> Void)?
    var onEndEditing: ((UITextField) -> Void)?
    var onShouldReturn: ((UITextField) -> Void)?
    var responder: UIResponder {
        return self.inputField
    }
    var validator: TextFieldValidation?

    // MARK: - Private Properties

    private let inputFieldContainer = UIView(frame: CGRect(x: 0, y: 0, width: Constants.fieldSize.width, height: Constants.fieldSize.height))
    private let inputField = UITextField()
    private let errorLabel = UILabel()

    private var nextInput: UIResponder?

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

    override func layoutSubviews() {
        inputFieldContainer.layer.cornerRadius = inputFieldContainer.frame.height / 2
    }

    // MARK: - Internal Methods

    func configure(placeholder: String?, correction: UITextAutocorrectionType, keyboardType: UIKeyboardType, mode: RoundInputFieldView.Mode) {
        inputField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                              attributes: [NSAttributedString.Key.foregroundColor: Color.InputFields.RoundInputField.text,
                                                                           NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)])
        inputField.autocorrectionType = correction
        inputField.keyboardType = keyboardType
        inputField.textContentType = mode.contentType
        inputField.isSecureTextEntry = mode == .password
    }

    /// Sets next responder, which will be activated after 'Next' button in keyboard will be pressed
    func setNextResponder(_ nextResponder: UIResponder) {
        inputField.returnKeyType = .next
        nextInput = nextResponder
    }

}

// MARK: - Configuration

private extension RoundInputFieldView {

    func setupInitialState() {
        configureErrorLabel()
        configureFieldContainer()
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

    func configureFieldContainer() {
        inputFieldContainer.backgroundColor = Color.InputFields.RoundInputField.background
        inputFieldContainer.layer.borderColor = Color.InputFields.RoundInputField.stroke.cgColor
        inputFieldContainer.layer.borderWidth = Constants.fieldStrokeWidth
        addSubview(inputFieldContainer)
    }

    func configureInputField() {
        inputField.font = .systemFont(ofSize: 12.0, weight: .regular)
        inputField.textColor = Color.InputFields.RoundInputField.tint
        inputField.tintColor = Color.InputFields.RoundInputField.tint
        inputField.delegate = self
        inputFieldContainer.addSubview(inputField)
        inputField.translatesAutoresizingMaskIntoConstraints = false

        let topFieldConstraint = inputField.topAnchor.constraint(equalTo: inputFieldContainer.topAnchor, constant: Constants.fieldMargin.top)
        let leftFieldConstraint = inputField.leftAnchor.constraint(equalTo: inputFieldContainer.leftAnchor, constant: Constants.fieldMargin.left)
        let rightFieldConstraint = inputField.rightAnchor.constraint(equalTo: inputFieldContainer.rightAnchor, constant: Constants.fieldMargin.right)
        let bottomFieldConstraint = inputField.bottomAnchor.constraint(equalTo: inputFieldContainer.bottomAnchor, constant: Constants.fieldMargin.bottom)

        NSLayoutConstraint.activate([topFieldConstraint, leftFieldConstraint, rightFieldConstraint, bottomFieldConstraint])
    }

    func configureConstraints() {
        inputFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        let topFieldConstraint = inputFieldContainer.topAnchor.constraint(equalTo: self.topAnchor)
        let leftFieldConstraint = inputFieldContainer.leftAnchor.constraint(equalTo: self.leftAnchor)
        let rightFieldConstraint = inputFieldContainer.rightAnchor.constraint(equalTo: self.rightAnchor)
        let heightFieldConstraint = inputFieldContainer.heightAnchor.constraint(equalToConstant: Constants.fieldSize.height)
        let widthFieldConstraint = inputFieldContainer.widthAnchor.constraint(equalToConstant: Constants.fieldSize.width)

        let topErrorLabelConstraint = errorLabel.topAnchor.constraint(equalTo: inputFieldContainer.bottomAnchor, constant: Constants.errorLabelTopSpace)
        let leftErrorLabelConstraint = errorLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.errorLabelLeftSpace)
        let rightErrorLabelConstraint = errorLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        let bottomErrorLabelConstraint = errorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        NSLayoutConstraint.activate([topFieldConstraint,
                                     leftFieldConstraint,
                                     rightFieldConstraint,
                                     heightFieldConstraint,
                                     widthFieldConstraint,
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
