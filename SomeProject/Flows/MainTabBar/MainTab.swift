//
//  MainTab.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

enum MainTab: Int, CaseIterable {

    case randomImages
    case playList
    case profile

    // MARK: - Properties

    var title: String {
        switch self {
        case .randomImages:
            return L10n.Maintabbar.Tabs.Randomimages.title
        case .playList:
            return L10n.Maintabbar.Tabs.Playlist.title
        case .profile:
            return L10n.Maintabbar.Tabs.Profile.title
        }
    }

    var image: UIImage {
        switch self {
        case .randomImages:
            return UIImage(asset: Asset.MainTabBar.image)
        case .playList:
            return UIImage(asset: Asset.MainTabBar.profile)
        case .profile:
            return UIImage(asset: Asset.MainTabBar.feed)
        }
    }

    var selectedImage: UIImage {
        return image
    }

}
