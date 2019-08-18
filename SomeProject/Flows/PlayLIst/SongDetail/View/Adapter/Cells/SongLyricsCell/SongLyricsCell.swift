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
        static let commonOffset: CGFloat = 16.0
        static let separatorHeight: CGFloat = 1.0
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
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        let topConstraint = titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.commonOffset)
        let leftConstraint = titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.commonOffset)
        let rightConstraint = titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.commonOffset)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint])
    }

    func configureSeparator() {
        separatorView.backgroundColor = Color.Main.highlight
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(separatorView)

        let topConstraint = separatorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.commonOffset)
        let leftConstraint = separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.commonOffset)
        let rightConstraint = separatorView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        let heightConstraint = separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint, heightConstraint])
    }

    func configureLyricsLabel() {
        lyricsLabel.textColor = Color.Main.text
        lyricsLabel.font = .systemFont(ofSize: 14.0, weight: .light)
        lyricsLabel.numberOfLines = 0
        lyricsLabel.text = nil
        lyricsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lyricsLabel)

        let topConstraint = lyricsLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: Constants.commonOffset)
        let leftConstraint = lyricsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.commonOffset)
        let rightConstraint = lyricsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.commonOffset)
        let bottomConstraint = lyricsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.commonOffset)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }

}
