//
//  AuthPageModuleConfigurator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class AuthPageModuleConfigurator {

    func configure() -> (UIViewController, AuthPageModuleOutput) {
        let view = AuthPageViewController()
        let presenter = AuthPagePresenter()

        presenter.view = view
        view.output = presenter
        return (view, presenter)
    }

}
