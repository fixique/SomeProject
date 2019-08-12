//
//  MainTabBarVIewOutput.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

protocol MainTabBarViewOutput {
    /// Notify presenter that user selects some tab
    ///
    /// - Parameter tab: which tab user did select
    /// - Parameter isInitial: flag, indicating that controller was created before
    func selectTab(with tab: MainTab, isInitial: Bool)
}
