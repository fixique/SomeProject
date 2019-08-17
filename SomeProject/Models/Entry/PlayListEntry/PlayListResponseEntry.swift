//
//  PlayListResponseEntry.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

struct PlayListResponseEntry: Decodable {

    // MARK: - Keys

    enum CodingKeys: String, CodingKey {
        case items
    }

    // MARK: - Properties

    let items: [SongEntry]
}

struct SongEntry: Decodable {

    // MARK: - Keys

    enum CodingKeys: String, CodingKey {
        case name
        case author
        case cover
        case text
    }

    // MARK: - Properties

    var name: String?
    var author: String?
    var cover: String?
    var text: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try? container.decode(String.self, forKey: .name)
        self.author = try? container.decode(String.self, forKey: .author)
        self.cover = try? container.decode(String.self, forKey: .cover)
        self.text = try? container.decode(String.self, forKey: .text)
    }

}
