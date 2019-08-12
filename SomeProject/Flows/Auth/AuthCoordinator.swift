//
//  AuthCoordinator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {

    // MARK: - AuthCoordinatorOutput

    var finishFlow: EmptyClosure?

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showAuthPage()
    }

}

// MARK: - Private Methods

private extension AuthCoordinator {

    func showAuthPage() {
        let (view, output) = AuthPageModuleConfigurator().configure()
        output.finishAuth = { [weak self] in
            self?.finishFlow?()
        }
        router.setRootModule(view)
    }

}
