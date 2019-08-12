//
//  ProfileCoordinator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 13/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

final class ProfileCoordinator: BaseCoordinator, ProfileCoordinatorOutput {

    // MARK: - ProfileCoordinatorOutput

    var onLogout: EmptyClosure?

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start() {
        showProfile()
    }

}

// MARK: - Private Methods

private extension ProfileCoordinator {

    func showProfile() {
        let (view, output) = ProfileModuleConfigurator().configure()
        output.onLogout = { [weak self] in
            self?.onLogout?()
        }
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

}
