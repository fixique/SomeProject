//
//  RandomImagesViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class RandomImagesViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let buttonSize = CGSize(width: 250.0, height: 30.0)
    }

    // MARK: - Properties

    var output: RandomImagesViewOutput?

    // MARK: - Private Properties

    private let randomImageView = UIImageView()
    private let buttonContainer = UIView()
    private let updateButton = UIButton(type: .custom)

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func viewDidLayoutSubviews() {
        updateButton.mainPrurpleStyle()
    }

}

// MARK: - RandomImagesViewInput

extension RandomImagesViewController: RandomImagesViewInput {

    func setupInitialState() {
        configureBackground()
        configureNavigationBar()
        configureImageView()
        configureButtonContainer()
        configureUpdateButton()
    }

    func setupRandomIamge(imagePath: String?) {
        randomImageView.downloadImage(urlPath: imagePath, placeholder: UIImage(asset: Asset.ImagePlaceholders.imagePlaceholder))
    }

}

// MARK: - Configuration

private extension RandomImagesViewController {

    func configureBackground() {
        view.backgroundColor = Color.Main.background
    }

    func configureNavigationBar() {
        navigationController?.applyWhiteNavigationBarStyle()
        title = L10n.Randomimages.Navbar.title
    }

    func configureImageView() {
        view.addSubview(randomImageView)
        randomImageView.contentMode = .scaleAspectFit
        randomImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
    }

    func configureButtonContainer() {
        view.addSubview(buttonContainer)
        buttonContainer.anchor(top: randomImageView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        buttonContainer.heightAnchor.constraint(equalTo: randomImageView.heightAnchor, multiplier: 1.0 / 3.0, constant: 0).isActive = true
    }

    func configureUpdateButton() {
        buttonContainer.addSubview(updateButton)
        updateButton.setTitle(L10n.Randomimages.Buttons.Update.title, for: .normal)
        updateButton.addTarget(self, action: #selector(updateButtonPressed), for: .touchUpInside)

        updateButton.anchorCenter(to: buttonContainer)
        updateButton.anchorSize(size: Constants.buttonSize)
    }

}

// MARK: - Actions

private extension RandomImagesViewController {

    @objc
    func updateButtonPressed() {
        output?.update()
    }

}
