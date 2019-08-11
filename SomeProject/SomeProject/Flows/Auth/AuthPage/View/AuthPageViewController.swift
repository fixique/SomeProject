//
//  AuthPageViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class AuthPageViewController: UIViewController {

    // MARK: - Properties

    var output: AuthPageViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - AuthPageViewInput

extension AuthPageViewController: AuthPageViewInput {

    func setupInitialState() {

    }

}
