//
//  MainTabBarModuleConfigurator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class MainTabBarModuleConfigurator {


    func configure() -> (UIViewController, MainTabBarModuleOutput) {
        let view = MainTabBarViewController()
        let presenter = MainTabBarPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
