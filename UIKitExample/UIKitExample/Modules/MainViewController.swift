//
//  ViewController.swift
//  UIKitExample
//
//  Created by Roman Guseynov on 21.11.2021.
//

/*
    Cycle one - start -> 02:50
 */

import UIKit
import SnapKit
import MVC_example

class MainViewController: UIViewController {
    
    
    func fetchData() {
        let headers = [
            "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com",
            "x-rapidapi-key": "eaa7878a61msh0a665338412fc6dp11db7fjsnea3a3c615af7"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://movie-database-imdb-alternative.p.rapidapi.com/?s=Avengers%20Endgame&r=json&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })

        dataTask.resume()
    }
    
    lazy var box = UIView()
    lazy var loginButton: LoginButton = {
        
        var btn =  LoginButton()
        self.view.addSubview(btn)
        btn.snp.makeConstraints {
            make in
            make.top.equalTo(self.loginTextField.snp.bottom).offset(15)
            make.height.width.equalTo(25)
            
        }
        
        btn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var loginTextField: UITextField = {
        var lgt = UITextField()
        self.view.addSubview(lgt)
        lgt.backgroundColor = .gray
        lgt.layer.cornerRadius = 8
        lgt.snp.makeConstraints {
            make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(30)
            make.leading.equalTo(self.view).offset(15)
            make.trailing.equalTo(self.view).offset(-15)
        }
        return lgt
    }()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
        
        
        self.view.backgroundColor = .white
        self.view.addSubview(box)
//        box.backgroundColor = AppColors.gainsboro
        box.snp.makeConstraints { (make) -> Void in
                   make.width.height.equalTo(120)
                   make.center.equalTo(self.view)
        }
        box.layer.cornerRadius = 8
        self.view.addSubview(loginButton)
        loginButton.backgroundColor = .red
        
        
        loginButton.layer.cornerRadius = 8
        
    }
    
    
    @objc func buttonPressed() {
        print("button pressed")
        
        self.loginButton.snp.remakeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
        }
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








