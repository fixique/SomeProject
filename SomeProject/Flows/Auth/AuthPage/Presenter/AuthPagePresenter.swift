//
//  AuthPagePresenter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

final class AuthPagePresenter: AuthPageModuleOutput {

    // MARK: - Properties

    weak var view: AuthPageViewInput?

}

// MARK: - AuthPageModuleInput

extension AuthPagePresenter: AuthPageModuleInput {}

// MARK: - AuthPageViewInput

extension AuthPagePresenter: AuthPageViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
