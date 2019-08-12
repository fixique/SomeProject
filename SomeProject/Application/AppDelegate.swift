//
//  AppDelegate.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Public Properties

    var window: UIWindow?

    // MARK: - Private Properties

    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()

    // MARK: - ApplicationService

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeRootView()
        applicationCoordinator.start()
        let keychain = KeychainService()
        do {
            try keychain.saveEmail("ubeto96@gmail.com")
        } catch let error {
            print(error.localizedDescription)
        }

        do {
            let email = try keychain.loadEmail()
            print(email)
        } catch let error {
            print(error.localizedDescription)
        }

        return true
    }

}

// MARK: - Private Configuration

private extension AppDelegate {

    func initializeRootView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
    }

    private func makeCoordinator() -> Coordinator {
        return ApplicationCoordinator()
    }

}
