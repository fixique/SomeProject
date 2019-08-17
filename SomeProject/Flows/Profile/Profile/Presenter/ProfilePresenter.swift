//
//  RandomImagesPresenter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

final class ProfilePresenter: ProfileModuleOutput {

    // MARK: - ProfileModuleOutput

    var onLogout: EmptyClosure?

    // MARK: - Properties

    weak var view: ProfileViewInput?

}

// MARK: - ProfileModuleInput

extension ProfilePresenter: ProfileModuleInput {}

// MARK: - ProfileViewOutput

extension ProfilePresenter: ProfileViewOutput {

    func viewLoaded() {
        let viewModel = configureProfileViewModel()
        view?.setupInitialState(with: viewModel)
    }

    func logout() {
        UserCredentialsManager.shared.logout()
        onLogout?()
    }

}

// MARK: - Help Methods

private extension ProfilePresenter {

    func configureProfileViewModel() -> ProfileViewModel {
        let email = UserCredentialsManager.shared.getEmail()
        return ProfileViewModel(userEmail: email)
    }

}
