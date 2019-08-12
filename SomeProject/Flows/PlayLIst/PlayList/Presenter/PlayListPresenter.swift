//
//  RandomImagesPresenter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

final class PlayListPresenter: PlayListModuleOutput {

    // MARK: - Properties

    weak var view: PlayListViewInput?

}

// MARK: - PlayListModuleInput

extension PlayListPresenter: PlayListModuleInput {}

// MARK: - PlayListViewOutput

extension PlayListPresenter: PlayListViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
