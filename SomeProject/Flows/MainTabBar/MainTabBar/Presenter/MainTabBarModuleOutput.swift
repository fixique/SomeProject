//
//  MainTabBarModuleOutput.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

typealias TabSelectClosure = (_ isInitial: Bool) -> Void

protocol MainTabBarModuleOutput: class {
    var onRandomImageFlowSelect: TabSelectClosure? { get set }
    var onPlayListFlowSelect: TabSelectClosure? { get set }
    var onProfileFlowSelect: TabSelectClosure? { get set }
}
