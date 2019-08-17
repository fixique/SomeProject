//
//  SongDetailViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 18/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {

    // MARK: - Properties

    var output: SongDetailViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - SongDetailViewInput

extension SongDetailViewController: SongDetailViewInput {

    func setupInitialState() {
        view.backgroundColor = Color.Main.background
    }

}
