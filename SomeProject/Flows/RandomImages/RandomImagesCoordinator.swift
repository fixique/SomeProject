//
//  RandomImagesCoordinator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 13/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

final class RandomImagesCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start() {
        showRandomImages()
    }

}

// MARK: - Private Methods

private extension RandomImagesCoordinator {

    func showRandomImages() {
        let (view, _) = RandomImagesModuleConfigurator().configure()
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

}
