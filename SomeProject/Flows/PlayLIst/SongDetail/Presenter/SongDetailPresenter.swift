//
//  SongDetailPresenter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 18/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

final class SongDetailPresenter: SongDetailModuleOutput {

    // MARK: - Properties

    weak var view: SongDetailViewInput?

    // MARK: - Private Properties

    private let songModel: SongViewModel

    // MARK: - Initialization

    init(with song: SongViewModel) {
        self.songModel = song
    }

}

// MARK: - SongDetailModuleInput

extension SongDetailPresenter: SongDetailModuleInput {}

// MARK: - SongDetailViewOutput

extension SongDetailPresenter: SongDetailViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}

