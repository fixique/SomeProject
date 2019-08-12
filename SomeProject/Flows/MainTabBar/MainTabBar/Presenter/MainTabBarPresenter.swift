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

    // MARK: - Private Properties

    private var currentTab: MainTab? = .randomImages

}

// MARK: - MainTabBarViewOutput

extension MainTabBarPresenter: MainTabBarViewOutput {

    func selectTab(with tab: MainTab, isInitial: Bool, isStackEmpty: Bool) {
        let isChanging = currentTabIsChanged(on: tab)
        switch tab {
        case .randomImages:
            onRandomImageFlowSelect?(isInitial, isChanging, isStackEmpty)
        case .playList:
            onPlayListFlowSelect?(isInitial, isChanging, isStackEmpty)
        case .profile:
            onProfileFlowSelect?(isInitial, isChanging, isStackEmpty)
        }
        currentTab = tab
    }

}

// MARK: - Private Methods

private extension MainTabBarPresenter {

    func currentTabIsChanged(on tab: MainTab) -> Bool {
        return currentTab != tab
    }

}
