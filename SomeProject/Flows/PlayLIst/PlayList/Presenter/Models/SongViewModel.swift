//
//  SongViewModel.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

struct SongViewModel {

    // MARK: - Properties

    let songName: String?
    let songAuthor: String?
    let songImagePath: String?
    let songText: String?

    // MARK: - Initialization

    init(with entry: SongEntry) {
        self.songName = entry.name
        self.songAuthor = entry.author
        self.songImagePath = entry.cover
        self.songText = entry.text
    }

}
