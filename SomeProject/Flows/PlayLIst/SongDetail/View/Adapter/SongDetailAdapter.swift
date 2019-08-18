//
//  SongDetailAdapter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 18/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class SongDetailAdapter: NSObject {

    // MARK: - Enums

    private enum Cells: Int {
        case header
        case lyrics
    }

    // MARK: - Constants

    private enum Constants {
        static let cellsCount: Int = 2
        static let estimatedRowHeight: CGFloat = 390.0
    }

    // MARK: - Private Properties

    private let tableView: UITableView
    private var model: SongViewModel?

    // MARK: - Initialization

    init(with tableView: UITableView) {
        tableView.registerCell(SongHeaderCell.self)
        tableView.registerCell(SongLyricsCell.self)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView = tableView
    }

    // MARK: - Internal Methods

    func configure(with model: SongViewModel) {
        self.model = model
        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension SongDetailAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.cellsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = Cells(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        switch cellType {
        case .header:
            return configureHeaderCell(tableView, indexPath: indexPath)
        case .lyrics:
            return configureLyricsCell(tableView, indexPath: indexPath)
        }
    }

}

// MARK: - Cells configuration

private extension SongDetailAdapter {

    func configureHeaderCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: SongHeaderCell.nameOfClass, for: indexPath) as? SongHeaderCell else {
            return UITableViewCell()
        }
        headerCell.configure(with: model)
        return headerCell
    }

    func configureLyricsCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let lyricsCell = tableView.dequeueReusableCell(withIdentifier: SongLyricsCell.nameOfClass, for: indexPath) as? SongLyricsCell else {
            return UITableViewCell()
        }
        lyricsCell.configure(with: model?.songText)
        return lyricsCell
    }

}
