//
//  AuthPageModuleOutput.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

protocol AuthPageModuleOutput: class {
    var finishAuth: EmptyClosure? { get set }
}
