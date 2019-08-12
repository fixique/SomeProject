//
//  MainTabBarPresenter.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

final class MainTabBarPresenter: MainTabBarModuleOutput {

    // MARK: - MainTabBarModuleOutput

    var onRandomImageFlowSelect: TabSelectClosure?
    var onPlayListFlowSelect: TabSelectClosure?
    var onProfileFlowSelect: TabSelectClosure?

    // MARK: - Properties

    weak var view: MainTabBarViewInput?

}

// MARK: - MainTabBarViewOutput

extension MainTabBarPresenter: MainTabBarViewOutput {

    func selectTab(with tab: MainTab, isInitial: Bool) {
        switch tab {
        case .randomImages:
            onRandomImageFlowSelect?(isInitial)
        case .playList:
            onPlayListFlowSelect?(isInitial)
        case .profile:
            onProfileFlowSelect?(isInitial)
        }
    }

}
