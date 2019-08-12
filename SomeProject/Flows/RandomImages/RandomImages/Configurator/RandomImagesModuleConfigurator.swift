//
//  RandomImagesModuleConfigurator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class RandomImagesModuleConfigurator {

    func configure() -> (UIViewController, RandomImagesModuleOutput) {
        let view = RandomImagesViewController()
        let presenter = RandomImagesPresenter()

        presenter.view = view
        view.output = presenter
        return (view, presenter)
    }

}
