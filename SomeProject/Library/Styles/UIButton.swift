//
//  UIButton.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

extension UIButton {

    func mainPrurpleStyle() {
        // Если бы это был реальный проект, то я бы потратил время на написания протокола для стилей UI элементов, не вижу смысла в тестовом проекте это делать(
        titleLabel?.font = .systemFont(ofSize: 12.0, weight: .regular)
        titleLabel?.textColor = Color.Buttons.MainPurple.text
        setBackgroundImage(UIImage(color: Color.Buttons.MainPurple.highlighted), for: .highlighted)
        setBackgroundImage(UIImage(color: Color.Buttons.MainPurple.background), for: .normal)
        layer.borderWidth = 1.0
        layer.borderColor = Color.Buttons.MainPurple.stroke.cgColor
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }

}
