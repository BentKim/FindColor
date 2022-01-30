//
//  AppCoordinator.swift
//  RxMVVMCJsonTblViewExample
//
//  Created by Taewoo Kim on 2022/01/23.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = TabBarController()
        window.makeKeyAndVisible()
    }
}
