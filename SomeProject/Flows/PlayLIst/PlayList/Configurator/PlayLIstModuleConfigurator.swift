//
//  RandomImagesModuleConfigurator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class PlayListModuleConfigurator {

    func configure() -> (UIViewController, PlayListModuleOutput) {
        let view = PlayListViewController()
        let presenter = PlayListPresenter()

        presenter.view = view
        view.output = presenter
        return (view, presenter)
    }

}
