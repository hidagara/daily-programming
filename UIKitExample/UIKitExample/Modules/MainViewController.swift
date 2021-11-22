//
//  ViewController.swift
//  UIKitExample
//
//  Created by Roman Guseynov on 21.11.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    lazy var box = UIView()
    lazy var loginButton = LoginButton()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .blue
        self.view.addSubview(box)
        box.backgroundColor = .green
        box.snp.makeConstraints { (make) -> Void in
                   make.width.height.equalTo(120)
                   make.center.equalTo(self.view)
        }
        box.layer.cornerRadius = 8
        self.view.addSubview(loginButton)
        loginButton.backgroundColor = .red
        
        loginButton.snp.makeConstraints {
            make in
            make.width.height.equalTo(100)
            make.top.equalTo(box.snp.bottom).offset(20)
            make.left.equalTo(box)
        }
        
        loginButton.layer.cornerRadius = 8
        
    }
}

/*
 TODO
 1. Add Fonts
 2. Add Colors
 3. Add Cool Loking Images
 4. Add Network Layer
 5. Add Tests
 
 Learn to concentrate for 4 hours straight, best case is 6 hours of straight coding, without any internet info (Just open XCode and code code code).
 */








