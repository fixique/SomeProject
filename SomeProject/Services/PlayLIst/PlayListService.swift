//
//  PlayListService.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

final class PlayListService {

    func getPlayListItems() -> PlayListResponseEntry? {
        guard let path = Bundle.main.path(forResource: "playlist", ofType: "json") else {
            return nil
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let list: PlayListResponseEntry? = try? JSONDecoder().decode(PlayListResponseEntry.self, from: data)
            return list
        } catch let error {
            #if DEBUG
            print("Error parse: \(error.localizedDescription)")
            #endif
            return nil
        }
    }

}
