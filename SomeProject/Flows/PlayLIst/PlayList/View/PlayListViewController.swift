//
//  RandomImagesViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class PlayListViewController: UIViewController {

    // MARK: - Properties

    var output: PlayListViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - PlayListViewInput

extension PlayListViewController: PlayListViewInput {

    func setupInitialState() {
    }

}
