//
//  SongHeaderCell.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 18/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class SongHeaderCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let songImageCornerRaduis: CGFloat = 5.0

        static let commonOffset: CGFloat = 16.0
        static let authorLabelTopOffset: CGFloat = 10.0
        static let separatorHeight: CGFloat = 1.0
    }

    // MARK: - Private Properties

    private let songImageView = UIImageView()
    private let songNameLabel = UILabel()
    private let songAuthorLabel = UILabel()
    private let separatorView = UIView()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitialState()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInitialState()
    }

    // MARK: - Internal Methods

    func configure(with model: SongViewModel?) {
        songImageView.downloadImage(urlPath: model?.songImagePath, placeholder: UIImage(asset: Asset.ImagePlaceholders.imagePlaceholder))
        songNameLabel.text = model?.songName
        songAuthorLabel.text = model?.songAuthor
    }

}

// MARK: - Configuration

private extension SongHeaderCell {

    func setupInitialState() {
        selectionStyle = .none
        configureImageView()
        configureSongNameLabel()
        configureSongAuthorLabel()
        configureSeparator()
    }

    func configureImageView() {
        songImageView.contentMode = .scaleAspectFill
        songImageView.layer.cornerRadius = Constants.songImageCornerRaduis
        songImageView.layer.masksToBounds = true
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songImageView)

        let topConstraint = songImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.commonOffset)
        let leftConstraint = songImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.commonOffset)
        let rightConstraint = songImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.commonOffset)
        let heigthConstraint = songImageView.heightAnchor.constraint(equalTo: songImageView.widthAnchor, multiplier: 1)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint, heigthConstraint])
    }

    func configureSongNameLabel() {
        songNameLabel.textColor = Color.Main.text
        songNameLabel.font = .systemFont(ofSize: 18.0, weight: .medium)
        songNameLabel.numberOfLines = 0
        songNameLabel.text = nil
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songNameLabel)

        let topConstraint = songNameLabel.topAnchor.constraint(equalTo: songImageView.bottomAnchor, constant: Constants.commonOffset)
        let leftConstraint = songNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.commonOffset)
        let rightConstraint = songNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.commonOffset)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint])
    }

    func configureSongAuthorLabel() {
        songAuthorLabel.textColor = Color.Main.text
        songAuthorLabel.font = .systemFont(ofSize: 14.0, weight: .light)
        songAuthorLabel.numberOfLines = 0
        songAuthorLabel.text = nil
        songAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songAuthorLabel)

        let topConstraint = songAuthorLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: Constants.authorLabelTopOffset)
        let leftConstraint = songAuthorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.commonOffset)
        let rightConstraint = songAuthorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.commonOffset)
        let bottomConstraint = songAuthorLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Constants.commonOffset)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }

    func configureSeparator() {
        separatorView.backgroundColor = Color.Main.highlight
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(separatorView)

        let leftConstraint = separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.commonOffset)
        let rightConstraint = separatorView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        let bottomConstraint = separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        let heightConstraint = separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight)

        NSLayoutConstraint.activate([leftConstraint, rightConstraint, bottomConstraint, heightConstraint])
    }

}
