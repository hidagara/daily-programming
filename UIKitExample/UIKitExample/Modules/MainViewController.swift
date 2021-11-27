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


class HeaderInfoView: UIView {
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var positionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    lazy var descriptionText: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.layer.cornerRadius = 8
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(usernameLabel)
        self.addSubview(positionLabel)
        
        usernameLabel.snp.makeConstraints {
            make in
            make.top.equalTo(self)
            make.leading.equalTo(self.snp.leading).offset(15)
            make.height.equalTo(100)
        }
        
        positionLabel.snp.makeConstraints {
            make in
            make.top.equalTo(self)
            make.leading.greaterThanOrEqualTo(self.usernameLabel.snp.trailing).offset(25)
            make.trailing.equalTo(self.snp.trailing).offset(-15)
            make.height.equalTo(100)
        }
    }
    
    func setupView(username: String) {
        self.usernameLabel.text = username
    }
    
}
struct ButtonData {
    let caption: String
    let viewController: UIViewController.Type
}
class MainViewController: UIViewController {
    
    
    let buttonsData: [ButtonData] = [ButtonData(caption: "PremiumModule", viewController: ProfileViewController.self)]
    
    // Container View for top content (table view with some info view)
    
     lazy var topContainerView: HeaderInfoView = {
        let view = HeaderInfoView()
         let vc = buttonsData[0].viewController.init()
         print(vc)
        return view
    }()
    
    
    // Buttons to navigate to other views
    
     lazy var buttonsTableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .red
         tableView.layer.cornerRadius = 8
        return tableView
    }()
    
    // Some product categories
    
    lazy var categoriesCollectionView: UIView = {
        let colView = UIView()
        colView.backgroundColor = .yellow
        colView.layer.cornerRadius = 8
        return colView
    }()
    
    // Some common info
    
    lazy var bottomContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 8
        return view
    }()
    
    
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
    
    
    private func stateValues() {
        
    }


    private func setupUI() {
        self.view.addSubview(buttonsTableView)
        self.view.addSubview(topContainerView)
        self.view.addSubview(categoriesCollectionView)
        self.view.addSubview(bottomContainerView)
        
        topContainerView.usernameLabel.text = "Roman Guseynov"
        topContainerView.positionLabel.text = "iOS Developer"
    
        self.view.backgroundColor = .white
        
        categoriesCollectionView.layer.opacity = 0.5
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.leading.equalTo(self.view).offset(25)
            make.trailing.equalTo(self.view).offset(-25)
            make.top.equalTo(self.buttonsTableView).offset(-45)
        }
        
        topContainerView.snp.makeConstraints { make in
            make.height.equalTo(250)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalTo(self.view).offset(15)
            make.trailing.equalTo(self.view).offset(-15)
        }
        
        
        buttonsTableView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(120)
            make.top.equalTo(self.topContainerView.snp.bottom).offset(15)
            make.leading.equalTo(self.view).offset(15)
            make.trailing.equalTo(self.view).offset(-15)
        }
        
        bottomContainerView.snp.makeConstraints { make in
            make.top.equalTo(self.buttonsTableView.snp.bottom).offset(15)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalTo(self.view).offset(15)
            make.trailing.equalTo(self.view).offset(-15)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
//        fetchData()
        
        
    }
    
    
    @objc func buttonPressed() {
        print("button pressed")
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








