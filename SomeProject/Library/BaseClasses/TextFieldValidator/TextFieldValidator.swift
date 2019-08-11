//
//  TextFieldValidator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

public protocol TextFieldValidation: class {
    func validate(_ text: String?) -> (isValid: Bool, errorMessage: String?)
}

final class TextFieldValidator {

    // MARK: - Private Properties

    private let regex: String

    // MARK: - Initialization

    init(regex: String) {
        do {
            _ = try NSRegularExpression(pattern: regex)
            self.regex = regex
        } catch let error {
            #if DEBUG
                print(error.localizedDescription)
            #endif
            self.regex = ""
        }
    }

}

// MARK: - TextFieldValidation

extension TextFieldValidator: TextFieldValidation {

    func validate(_ text: String?) -> (isValid: Bool, errorMessage: String?) {
        guard let text = text, !text.isEmpty else {
            return (false, L10n.Authpage.Inputfield.Errors.empty)
        }

        let matches = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = matches.evaluate(with: text)
        return isValid ? (true, nil) : (false, L10n.Authpage.Inputfield.Errors.incorrect)
    }

}
