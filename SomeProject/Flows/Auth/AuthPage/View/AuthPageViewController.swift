//
//  AuthPageViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class AuthPageViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let logoSize = CGSize(width: 150.0, height: 150.0)
    }

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

// MARK: - Configuration

private extension AuthPageViewController {

    func configureLogo() -> UIImageView {
        let image = UIImage(asset: Asset.AuthPage.logo)
        return UIImageView(image: image)
    }

}
