//
//  UserCredentialsManager.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 13/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation

final class UserCredentialsManager {

    // MARK: - Properties

    static let shared = UserCredentialsManager()

    var state: UserState {
        return isAuthorized ? .loggedIn : .notAuthorized
    }

    // MARK: - Private Properties

    private let keychain = KeychainService()
    private var isAuthorized: Bool {
        return getEmail() != nil
    }

    // MARK: - Internal Methods

    func saveEmail(_ email: String) {
        do {
            try keychain.saveEmail(email)
        } catch let error {
            showError(error: error)
        }
    }

    func getEmail() -> String? {
        do {
            let email = try keychain.loadEmail()
            return email
        } catch let error {
            showError(error: error)
            return nil
        }
    }

    func logout() {
        do {
            try keychain.removeEmail()
        } catch let error {
            showError(error: error)
        }
    }

}

// MARK: - Private Methods

private extension UserCredentialsManager {

    func showError(error: Error) {
        #if DEBUG
        print(error.localizedDescription)
        #endif
    }

}
