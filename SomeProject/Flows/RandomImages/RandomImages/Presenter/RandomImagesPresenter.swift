//
//  RandomImagesPresenter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

final class RandomImagesPresenter: RandomImagesModuleOutput {

    // MARK: - Properties

    weak var view: RandomImagesViewInput?

}

// MARK: - RandomImagesModuleInput

extension RandomImagesPresenter: RandomImagesModuleInput {}

// MARK: - RandomImage

extension RandomImagesPresenter: RandomImagesViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
