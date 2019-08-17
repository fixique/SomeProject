//
//  ProfileViewModel.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

struct ProfileViewModel {

    // MARK: - Properties

    let userEmail: String?
    let userAvatar: String

    // MARK: - Initialization

    init(userEmail: String?) {
        self.userEmail = userEmail
        self.userAvatar = "https://avatars0.githubusercontent.com/u/24375978?s=460&v=4"
    }

}
