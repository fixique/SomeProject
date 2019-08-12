//
//  RandomImagesViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class RandomImagesViewController: UIViewController {

    // MARK: - Properties

    var output: RandomImagesViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - RandomImagesViewInput

extension RandomImagesViewController: RandomImagesViewInput {

    func setupInitialState() {
        configureBackground()
        print("\(UserCredentialsManager.shared.getEmail() ?? "Email empty")")
    }

}

// MARK: - Configuration

private extension RandomImagesViewController {

    func configureBackground() {
        view.backgroundColor = Color.Main.background
    }

}
