//
//  PlayListCoordinator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 13/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

final class PlayListCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start() {
        showPlayList()
    }

}

// MARK: - Private Methods

private extension PlayListCoordinator {

    func showPlayList() {
        let (view, _) = PlayListModuleConfigurator().configure()
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

}
