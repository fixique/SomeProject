//
//  RandomImagesViewOutput.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

protocol PlayListViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()
    /// Notify presenter that view select song
    func songSelect(song: SongViewModel)
}
