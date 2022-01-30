//
//  ViewController.swift
//  FindColor
//
//  Created by Taewoo Kim on 2022/01/31.
//

import UIKit

class ViewController: UIViewController {
    
    static func instantiate() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
//        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

