//
//  SongCell.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let songImageViewSize = CGSize(width: 80.0, height: 80.0)
        static let songImageCornerRaduis: CGFloat = 5.0
        static let commonOffset: CGFloat = 16.0

        static let separatorHeight: CGFloat = 1.0
        static let animationDuration: TimeInterval = 0.3

        static let authorLabelTopOffset: CGFloat = 10.0
    }

    // MARK: – Private Properties

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

    // MARK: - UITableViewCell

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        UIView.animate(withDuration: Constants.animationDuration) {
            self.contentView.backgroundColor = highlighted ? Color.Main.highlight : Color.Main.background
        }
    }

    // MARK: - Internal Methods

    func configure(with model: SongViewModel) {
        songImageView.downloadImage(urlPath: model.songImagePath, placeholder: UIImage(asset: Asset.ImagePlaceholders.imagePlaceholder))
        songNameLabel.text = model.songName
        songAuthorLabel.text = model.songAuthor
    }

}

// MARK: - Configuration

private extension SongCell {

    func setupInitialState() {
        selectionStyle = .none
        configureImageView()
        configureSeparator()
        configureSongNameLabel()
        configureSongAuthorLabel()
    }

    func configureImageView() {
        songImageView.contentMode = .scaleAspectFit
        songImageView.layer.cornerRadius = Constants.songImageCornerRaduis
        songImageView.layer.masksToBounds = true
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songImageView)

        let topConstraint = songImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.commonOffset)
        let leftConstraint = songImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.commonOffset)
        let heightConstraint = songImageView.heightAnchor.constraint(equalToConstant: Constants.songImageViewSize.height)
        let widthConstraint = songImageView.widthAnchor.constraint(equalToConstant: Constants.songImageViewSize.width)
        let bottomConstraint = songImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Constants.commonOffset)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, heightConstraint, widthConstraint, bottomConstraint])
    }

    func configureSeparator() {
        separatorView.backgroundColor = Color.Main.highlight
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(separatorView)

        let leftConstraint = separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        let rightConstraint = separatorView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        let bottomConstraint = separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        let heightConstraint = separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight)

        NSLayoutConstraint.activate([leftConstraint, rightConstraint, bottomConstraint, heightConstraint])
    }

    func configureSongNameLabel() {
        songNameLabel.textColor = Color.Main.text
        songNameLabel.font = .systemFont(ofSize: 18.0, weight: .medium)
        songNameLabel.numberOfLines = 0
        songNameLabel.text = nil
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songNameLabel)

        let topConstraint = songNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.commonOffset)
        let leftConstraint = songNameLabel.leftAnchor.constraint(equalTo: songImageView.rightAnchor, constant: Constants.commonOffset)
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
        let leftConstraint = songAuthorLabel.leftAnchor.constraint(equalTo: songImageView.rightAnchor, constant: Constants.commonOffset)
        let rightConstraint = songAuthorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.commonOffset)
        let bottomConstraint = songAuthorLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Constants.commonOffset)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }

}
