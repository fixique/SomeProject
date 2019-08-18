//
//  SongDetailViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 18/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {

    // MARK: - Properties

    var output: SongDetailViewOutput?

    // MARK: - Private Properties

    private let tableView = UITableView()
    private var adapter: SongDetailAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - SongDetailViewInput

extension SongDetailViewController: SongDetailViewInput {

    func setupInitialState() {
        configureBackground()
        configureTableView()
    }

    func configure(with song: SongViewModel) {
        title = song.songName
        adapter?.configure(with: song)
    }

}

// MARK: - Configuration

private extension SongDetailViewController {

    func configureBackground() {
        view.backgroundColor = Color.Main.background
    }

    func configureTableView() {
        adapter = SongDetailAdapter(with: tableView)
        tableView.dataSource = adapter
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        let topConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor)
        let leftConstraint = tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        let bottomConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }

}
