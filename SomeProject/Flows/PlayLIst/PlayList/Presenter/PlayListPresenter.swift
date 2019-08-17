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
//        let song = SongViewModel(songName: "Runaway Baby", songAuthor: "Bruno Mars", songImagePath: "https://sun9-54.userapi.com/c853520/v853520781/c34ed/2JRFzwKjExY.jpg", songText: nil)
//        let some = [song, song, song, song, song, song, song, song]
        let items = PlayListService().getPlayListItems()?.items ?? []
        let viewModels = items.compactMap({ SongViewModel(with: $0) })
        view?.configure(with: viewModels)
    }

    func songSelect(song: SongViewModel) {
        onSongSelect?(song)
    }

}
