//
//  SongLyricsCell.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 18/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class SongLyricsCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let titleLabelPadding = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 16.0)
        static let separatorPadding = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0)
        static let separatorSize = CGSize(width: 0.0, height: 1.0)
        static let lyricsLabelPadding = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
    }

    // MARK: - Private Properties

    private let titleLabel = UILabel()
    private let separatorView = UIView()
    private let lyricsLabel = UILabel()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitialState()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInitialState()
    }

    // MARK: – Internal Methods

    func configure(with text: String?) {
        lyricsLabel.text = text
    }

}

// MARK: - Configuration

private extension SongLyricsCell {

    func setupInitialState() {
        selectionStyle = .none
        configureTitleLabel()
        configureSeparator()
        configureLyricsLabel()
    }

    func configureTitleLabel() {
        titleLabel.textColor = Color.Main.text
        titleLabel.font = .systemFont(ofSize: 18.0, weight: .medium)
        titleLabel.text = L10n.Songdetail.Lyricscell.title
        contentView.addSubview(titleLabel)
        titleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: Constants.titleLabelPadding)
    }

    func configureSeparator() {
        separatorView.backgroundColor = Color.Main.highlight
        contentView.addSubview(separatorView)
        separatorView.anchor(top: titleLabel.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: Constants.separatorPadding, size: Constants.separatorSize)
    }

    func configureLyricsLabel() {
        lyricsLabel.textColor = Color.Main.text
        lyricsLabel.font = .systemFont(ofSize: 14.0, weight: .light)
        lyricsLabel.numberOfLines = 0
        lyricsLabel.text = nil
        contentView.addSubview(lyricsLabel)
        lyricsLabel.anchor(top: separatorView.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: Constants.lyricsLabelPadding)
    }

}
