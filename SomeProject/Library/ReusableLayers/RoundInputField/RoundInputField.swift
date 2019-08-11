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

    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

// MARK: - Configuration

private extension RoundInputField {

    func configureStyle() {
//        backgroundColor = UICo
    }
}
