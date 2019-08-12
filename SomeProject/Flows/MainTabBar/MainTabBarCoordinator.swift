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
        
    }

}
