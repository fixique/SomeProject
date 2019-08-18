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
        static let songImagePadding = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 16.0)
        static let songNamePadding = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 16.0)
        static let songAuthorPadding = UIEdgeInsets(top: 10.0, left: 16.0, bottom: -16.0, right: 16.0)
        static let separatorPadding = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 0.0)
        static let separatorSize = CGSize(width: 0.0, height: 1.0)
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
        contentView.addSubview(songImageView)
        songImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: Constants.songImagePadding)
        songImageView.heightAnchor.constraint(equalTo: songImageView.widthAnchor, multiplier: 1).isActive = true
    }

    func configureSongNameLabel() {
        songNameLabel.textColor = Color.Main.text
        songNameLabel.font = .systemFont(ofSize: 18.0, weight: .medium)
        songNameLabel.numberOfLines = 0
        songNameLabel.text = nil
        contentView.addSubview(songNameLabel)
        songNameLabel.anchor(top: songImageView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: Constants.songNamePadding)
    }

    func configureSongAuthorLabel() {
        songAuthorLabel.textColor = Color.Main.text
        songAuthorLabel.font = .systemFont(ofSize: 14.0, weight: .light)
        songAuthorLabel.numberOfLines = 0
        songAuthorLabel.text = nil
        contentView.addSubview(songAuthorLabel)

        songAuthorLabel.anchor(top: songNameLabel.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: Constants.songAuthorPadding)
        songAuthorLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: Constants.songAuthorPadding.bottom).isActive = true
    }

    func configureSeparator() {
        separatorView.backgroundColor = Color.Main.highlight
        contentView.addSubview(separatorView)
        separatorView.anchor(leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: Constants.separatorPadding, size: Constants.separatorSize)
    }

}
