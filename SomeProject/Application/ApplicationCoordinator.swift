//
//  ApplicationCoordinator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 13/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

enum UserState {
    case notAuthorized
    case loggedIn
}

private enum LaunchInstructor {
    case auth
    case main

    static func configure(userState: UserState) -> LaunchInstructor {
        switch userState {
        case .notAuthorized:
            return .auth
        case .loggedIn:
            return .main
        }
    }

}

final class ApplicationCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private var instructor: LaunchInstructor {
        return Bool.random() ? .main : .auth
    }

    // MARK: - Coordinator

    override func start() {
        switch instructor {
        case .auth:
            runAuthFlow()
        case .main:
            runMainFlow()
        }
    }

}

// MARK: - Private Methods

private extension ApplicationCoordinator {

    func runAuthFlow() {
        let router = MainRouter()
        let coordinator = AuthCoordinator(router: router)
        coordinator.finishFlow = { [weak self] in
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

    func runMainFlow() {
        let router = MainRouter()
        let coordinator = MainTabBarCoordinator(router: router)
        coordinator.onLogout = { [weak self] in
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

}
