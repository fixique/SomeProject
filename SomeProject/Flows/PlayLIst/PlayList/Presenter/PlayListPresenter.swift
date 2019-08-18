//
//  RandomImagesPresenter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

final class PlayListPresenter: PlayListModuleOutput {

    // MARK: - PlayListModuleOutput

    var onSongSelect: SelectSongClosure?

    // MARK: - Properties

    weak var view: PlayListViewInput?

}

// MARK: - PlayListModuleInput

extension PlayListPresenter: PlayListModuleInput {}

// MARK: - PlayListViewOutput

extension PlayListPresenter: PlayListViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
        configurePlayList()
    }

    func songSelect(song: SongViewModel) {
        onSongSelect?(song)
    }

}

// MARK: - Private Methods

private extension PlayListPresenter {

    func configurePlayList() {
        let items = PlayListService().getPlayListItems()?.items ?? []
        let viewModels = items.compactMap { SongViewModel(with: $0) }
        view?.configure(with: viewModels)
    }

}
