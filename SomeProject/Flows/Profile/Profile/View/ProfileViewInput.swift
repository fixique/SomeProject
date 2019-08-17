//
//  RandomImagesViewInput.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

protocol ProfileViewInput: class {
    /// Method for setup initial state of view
    func setupInitialState(with model: ProfileViewModel)
}
