//
//  MainTabBarViewController.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    // MARK: - Constants 

    private enum Constants {
        static let tabBarItemTitleFont = UIFont.systemFont(ofSize: 10, weight: .regular)
        static let tabBarItemTitleOffset = UIOffset(horizontal: 0, vertical: -2)
        static let backgroundBlurAlpha: CGFloat = 0.8
    }

    // MARK: - Properties

    var output: MainTabBarViewOutput?

    // MARK: - Private Properties

    private var isSelectableStackEmpty: Bool = true

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        configureAppearance()
        configureControllers()
    }

}

// MARK: - MainTabBarViewInput

extension MainTabBarViewController: MainTabBarViewInput {
}

// MARK: - UITabBarControllerDelegate

extension MainTabBarViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let navigationController = viewController as? UINavigationController
        var isStackEmpty = true
        if let isEmpty = navigationController?.viewControllers.isEmpty, !isEmpty {
            isStackEmpty = navigationController?.visibleViewController == navigationController?.viewControllers[0]
        }
        isSelectableStackEmpty = isStackEmpty
        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let tab = MainTab(rawValue: viewController.tabBarItem.tag) else {
            return
        }
        let navigationController = viewController as? UINavigationController
        let isInitial = navigationController?.viewControllers.isEmpty ?? true
        output?.selectTab(with: tab, isInitial: isInitial, isStackEmpty: isSelectableStackEmpty)
    }

}

// MARK: - Configuration

private extension MainTabBarViewController {

    func configureAppearance() {
        tabBar.barTintColor = UIColor.clear
        tabBar.tintColor = Color.TabBar.selectedTabItem
        tabBar.unselectedItemTintColor = Color.TabBar.tabItem
        tabBar.shadowImage = UIImage(color: Color.TabBar.stroke)
        tabBar.backgroundImage = UIImage(color: Color.TabBar.background)
    }

    func configureControllers() {
        var controllers: [UIViewController] = []
        for tab in MainTab.allCases {
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            tabBarItem.tag = tab.rawValue
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: Constants.tabBarItemTitleFont], for: .normal)
            tabBarItem.titlePositionAdjustment = Constants.tabBarItemTitleOffset

            let navigationController = UINavigationController()
            navigationController.tabBarItem = tabBarItem
            controllers.append(navigationController)
        }
        viewControllers = controllers
    }

}
