//
//  ProfileCoordinatorOutput.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 13/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

protocol ProfileCoordinatorOutput: class {
    var onLogout: EmptyClosure? { get set }
}
