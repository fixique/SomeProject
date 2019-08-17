//
//  SongDetailModuleConfigurator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 18/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class SongDetailModuleConfigurator {

    func configure(with song: SongViewModel) -> (UIViewController, SongDetailModuleOutput) {
        let view = SongDetailViewController()
        let presenter = SongDetailPresenter(with: song)

        presenter.view = view
        view.output = presenter
        return (view, presenter)
    }

}
