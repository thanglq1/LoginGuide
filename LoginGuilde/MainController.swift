//
//  MainController.swift
//  LoginGuilde
//
//  Created by ThangLQ on 4/7/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        if isLogin() {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        } else {
            perform(#selector(showHomeController), with: nil, afterDelay: 0.01)
            
        }
    }
    
    func showHomeController() {
        let homeController = HomeController()
        present(homeController, animated: true, completion: nil)
    }
    
    func showLoginController() {
        let loginController = ViewController()
        present(loginController, animated: true, completion: nil)
    }
    
    func isLogin() -> Bool {
        return true
    }
}
