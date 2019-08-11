//
//  AuthPageViewOutput.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

protocol AuthPageViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()
    /// Notify presenter that view is ready to login action
    func loginAction()
}
