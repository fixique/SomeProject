//
//  Coordinator.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    /// Notifies coordinator that it can start itself
    func start()
    /// Notifies coordinator that is should remove all child coordinators
    func removeAllChilds()
}
