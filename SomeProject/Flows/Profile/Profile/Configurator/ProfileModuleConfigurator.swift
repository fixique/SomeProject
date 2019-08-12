//
//  RandomImagesModuleConfigurator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class ProfileModuleConfigurator {

    func configure() -> (UIViewController, ProfileModuleOutput) {
        let view = ProfileViewController()
        let presenter = ProfilePresenter()

        presenter.view = view
        view.output = presenter
        return (view, presenter)
    }

}
