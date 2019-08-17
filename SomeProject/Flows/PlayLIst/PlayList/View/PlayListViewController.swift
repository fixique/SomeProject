//
//  RandomImagesViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class PlayListViewController: UIViewController {

    // MARK: - Properties

    var output: PlayListViewOutput?

    // MARK: - Private Properties

    private let tableView = UITableView()
    private var adapter: PlayListAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - PlayListViewInput

extension PlayListViewController: PlayListViewInput {

    func setupInitialState() {
        configureBackground()
        configureNavigationBar()
        configureTableView()
    }

    func configure(with models: [SongViewModel]) {
        adapter?.configure(with: models)
    }

}

// MARK: - Configuration

private extension PlayListViewController {

    func configureBackground() {
        view.backgroundColor = Color.Main.background
    }

    func configureNavigationBar() {
        navigationController?.applyWhiteNavigationBarStyle()
        title = L10n.Playlist.Navbar.title
    }

    func configureTableView() {
        adapter = PlayListAdapter(with: tableView)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        let topConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor)
        let leftConstraint = tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        let bottomConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint, bottomConstraint])

        adapter?.didSelectSong = { [weak self] song in
            self?.output?.songSelect(song: song)
        }
    }

}
