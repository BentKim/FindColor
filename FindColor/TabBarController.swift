//
//  TabBarController.swift
//  RxMVVMCJsonTblViewExample
//
//  Created by Taewoo Kim on 2022/01/31.
//
import UIKit
class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController = ViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        let firstTab = navigationController
        firstTab.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        // 위 같이, 필요한 Tab을 추가해주세요!
        self.viewControllers = [firstTab]
    }
}

