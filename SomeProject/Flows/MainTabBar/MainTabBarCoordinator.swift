//
//  MainTabBarCoordinator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

final class MainTabBarCoordinator: BaseCoordinator, MainTabBarCoordinatorOutput {

    // MARK: - MainTabBarCoordinatorOutput

    var onLogout: EmptyClosure?

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start() {
        showTabBar()
    }

}

// MARK: - Private Methods

private extension MainTabBarCoordinator {

    func showTabBar() {
        let (view, output) = MainTabBarModuleConfigurator().configure()

        output.onRandomImageFlowSelect = runRandomImagesFlow
        output.onPlayListFlowSelect = runPlayListFlow
        output.onProfileFlowSelect = runProfileFlow

        router.setRootModule(view)
        runRandomImagesFlow(isInitial: true)
    }

    func runRandomImagesFlow(isInitial: Bool) {
        guard isInitial else {
            return
        }
        let coordinator = RandomImagesCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }

    func runPlayListFlow(isInitial: Bool) {
        guard isInitial else {
            return
        }
        let coordinator = PlayListCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }

    func runProfileFlow(isInitial: Bool) {
        guard isInitial else {
            return
        }
        let coordinator = ProfileCoordinator(router: router)
        coordinator.onLogout = { [weak self] in
            self?.onLogout?()
        }
        addDependency(coordinator)
        coordinator.start()
    }

}
