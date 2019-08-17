//
//  PlayListAdapter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

typealias SelectSongClosure = (SongViewModel) -> Void

final class PlayListAdapter: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let estimatedRowHeight: CGFloat = 112.0
    }

    // MARK: – Properties

    var didSelectSong: SelectSongClosure?

    // MARK: - Private Properties

    private let tableView: UITableView
    private var models: [SongViewModel] = []

    // MARK: - Initialization

    init(with tableView: UITableView) {
        tableView.registerCell(SongCell.self)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView = tableView
    }

    // MARK: - Configure

    func configure(with models: [SongViewModel]) {
        self.models = models
        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension PlayListAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let songCell = tableView.dequeueReusableCell(withIdentifier: SongCell.nameOfClass, for: indexPath) as? SongCell else {
            return UITableViewCell()
        }
        songCell.configure(with: models[indexPath.row])
        return songCell
    }

}

// MARK: - UITableViewDelegate

extension PlayListAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectSong?(models[indexPath.row])
    }

}
