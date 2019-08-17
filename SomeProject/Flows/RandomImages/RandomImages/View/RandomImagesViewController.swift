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
        randomImageView.translatesAutoresizingMaskIntoConstraints = false
        randomImageView.contentMode = .scaleAspectFit

        let imageViewTopConstraint = randomImageView.topAnchor.constraint(equalTo: view.topAnchor)
        let imageViewLeftConstraint = randomImageView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let imageViewRightConstraint = randomImageView.rightAnchor.constraint(equalTo: view.rightAnchor)

        NSLayoutConstraint.activate([imageViewTopConstraint, imageViewLeftConstraint, imageViewRightConstraint])
    }

    func configureButtonContainer() {
        view.addSubview(buttonContainer)
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false

        let containerViewTopConstraint = buttonContainer.topAnchor.constraint(equalTo: randomImageView.bottomAnchor)
        let containerViewLeftConstraint = buttonContainer.leftAnchor.constraint(equalTo: view.leftAnchor)
        let containerViewRightConstraint = buttonContainer.rightAnchor.constraint(equalTo: view.rightAnchor)
        let containerViewBottomConstraint = buttonContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let containerViewHeightConstraint = buttonContainer.heightAnchor.constraint(equalTo: randomImageView.heightAnchor, multiplier: 1.0 / 3.0, constant: 0)

        NSLayoutConstraint.activate([containerViewTopConstraint, containerViewLeftConstraint, containerViewRightConstraint, containerViewBottomConstraint, containerViewHeightConstraint])
    }

    func configureUpdateButton() {
        buttonContainer.addSubview(updateButton)
        updateButton.setTitle(L10n.Randomimages.Buttons.Update.title, for: .normal)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.addTarget(self, action: #selector(updateButtonPressed), for: .touchUpInside)

        let verticalConstraint = updateButton.centerYAnchor.constraint(equalTo: buttonContainer.centerYAnchor)
        let horizontalConstraint = updateButton.centerXAnchor.constraint(equalTo: buttonContainer.centerXAnchor)
        let heightConstraint = updateButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height)
        let widthConstraint = updateButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width)

        NSLayoutConstraint.activate([verticalConstraint, horizontalConstraint, heightConstraint, widthConstraint])
    }

}

// MARK: - Actions

private extension RandomImagesViewController {

    @objc
    func updateButtonPressed() {
        output?.update()
    }

}
