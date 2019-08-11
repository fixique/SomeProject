//
//  RoundInputField.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class RoundInputField: UITextField {

    // MARK: - Constants

    private enum Constants {
        static let strokeWidth: CGFloat = 1.0
        static let padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        static let cornerRadius: CGFloat = 25.0
    }

    // MARK: - Properties

    override var placeholder: String? {
        didSet {
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                       attributes: [NSAttributedString.Key.foregroundColor: Color.InputFields.RoundInputField.text,
                                                                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)])
        }
    }

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

    // MARK: - UITextField

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.padding)
    }

    override func layoutSubviews() {
        layer.cornerRadius = frame.height / 2
    }

}

// MARK: - Configuration

private extension RoundInputField {

    func setupInitialState() {
        configureStyle()
        configureTextStyle()
    }

    func configureStyle() {
        backgroundColor = Color.InputFields.RoundInputField.background
        borderStyle = .none
        layer.borderColor = Color.InputFields.RoundInputField.stroke.cgColor
        layer.borderWidth = Constants.strokeWidth
        layer.masksToBounds = true
    }

    func configureTextStyle() {
        font = .systemFont(ofSize: 12.0, weight: .regular)
        textColor = Color.InputFields.RoundInputField.tint
        tintColor = Color.InputFields.RoundInputField.tint
    }

}
