//
//  RandomImagesPresenter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

final class RandomImagesPresenter: RandomImagesModuleOutput {

    // MARK: - Properties

    weak var view: RandomImagesViewInput?

    // MARK: - Private Properties

    private var imagesUrls: [String] = []

}

// MARK: - RandomImagesModuleInput

extension RandomImagesPresenter: RandomImagesModuleInput {}

// MARK: - RandomImage

extension RandomImagesPresenter: RandomImagesViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
        configureImageUrlArray()
        view?.setupRandomIamge(imagePath: imagesUrls.randomElement())
    }

    func update() {
        view?.setupRandomIamge(imagePath: imagesUrls.randomElement())
    }

}

// MARK: - Private Methods

private extension RandomImagesPresenter {

    func configureImageUrlArray() {
        imagesUrls.append("https://images.unsplash.com/photo-1559118005-b73c28191e2c?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1565412741477-ecf69b6c17d5?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1556787713-70719c7d9a3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1552633832-4f5a1b110980?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1552845775-a7a50f21deb0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1556909045-0c5f6f635b57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1555980068-338f9b56acb6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1355&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1561312176-5aedf7172115?ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1559216406-beda67bab4fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1564760055775-d63b17a55c44?ixlib=rb-1.2.1&auto=format&fit=crop&w=1356&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1564668740471-16a0ab819aa9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1564000689425-2f3898b441ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=658&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1562961798-5ba5db914f03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1332&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1565299390096-8e363b857759?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1561196643-35c381cb6a6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1561078451-8ebb052326ec?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1563050961-a9f5ce7acb50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1558237316-d4762d4b8ce7?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1558860360-02e231e9d947?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1558960561-ad9fef3d65f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
        imagesUrls.append("https://images.unsplash.com/photo-1559157693-d42bc4841fc8?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80")
    }

}
