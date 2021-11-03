//
//  ViewController.swift
//  MVC-example
//
//  Created by Roman Guseynov on 28.10.2021.
//

import UIKit
import Combine

class ViewController: UIViewController {
    var data = [UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green, UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green, UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green, UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green]
    
    @Published var loginTextField = UITextField()
    var loginLabel = UILabel()
    var passwordTextField = UITextField()
    var passwordLabel = UILabel()
    var loginButton = DefaultButton()
    var appleButton = SignInAppleButton()
    let onboardingButton = DefaultButton()
    
    var materialCollection: UICollectionView!
    
    
    override func loadView() {
        super.loadView()
//        setupLoginLabel()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                // make sure that there is a slightly larger gap at the top of each row
                layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
                // set a standard item size of 60 * 60
                layout.itemSize = CGSize(width: 60, height: 60)
                // the layout scrolls horizontally
                layout.scrollDirection = .horizontal
                // set the frame and layout
                // set the view to be this UICollectionView
        self.materialCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        setupLoginLabel()
        setupLoginTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupLoginButton()
        setupSignInAppleButton()
        setupOnboardingButton()
        setupMaterialCollection()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.gainsboro
        // Do any additional setup after loading the view.
       
    }
    
    
    
    func setupMaterialCollection() {
        self.materialCollection.dataSource = self
                // set the delegate
                self.materialCollection.delegate = self
                // register the standard cell
                self.materialCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
                // bounce at the bottom of the collection view
                self.materialCollection.alwaysBounceVertical = true
                // set the background to be white
        self.materialCollection.backgroundColor = AppColors.claret
        materialCollection.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(materialCollection)
        
        
        materialCollection.backgroundColor = AppColors.prussianBlue
        materialCollection.tintColor = AppColors.claret
        
        
        let leadingConstraint = NSLayoutConstraint(item: materialCollection, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 15)
        let trailingConstraint = NSLayoutConstraint(item: materialCollection, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -15)
        let verticalConstraint = NSLayoutConstraint(item: materialCollection, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: onboardingButton, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 10)
        let heightConstraint = NSLayoutConstraint(item: materialCollection, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint,verticalConstraint, heightConstraint])
    }
    
    func setupLoginLabel() {
        self.view.addSubview(loginLabel)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "Login"
        loginLabel.font = UIFont.init(name: "Nunito-Bold", size: 24)
        let horizontalConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 15)
        let verticalConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        NSLayoutConstraint.activate([horizontalConstraint,verticalConstraint, widthConstraint])
    }
    
    
    func setupLoginTextField() {
        self.view.addSubview(loginTextField)
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.placeholder = "Your email"
        loginTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        
        let verticalConstraint = NSLayoutConstraint(item: loginTextField, attribute: .top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: loginLabel, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 15)
        let trailingConstraint = NSLayoutConstraint(item: loginTextField, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 15)
        let leadingConstraint = NSLayoutConstraint(item: loginTextField, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -15)
        let heightConstraint = NSLayoutConstraint(item: loginTextField, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
        NSLayoutConstraint.activate([trailingConstraint, leadingConstraint, verticalConstraint,heightConstraint,])
    }
    
    
    func setupPasswordLabel() {
        self.view.addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.font = UIFont(name: "Nunito-Regular", size: 24)
        passwordLabel.text = "Password"
        passwordLabel.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let horizontalConstraint = NSLayoutConstraint(item: passwordLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 15)
        let verticalConstraint = NSLayoutConstraint(item: passwordLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: loginTextField, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 15)
        let widthConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        NSLayoutConstraint.activate([horizontalConstraint,verticalConstraint, widthConstraint])
    }
    
    func setupPasswordTextField() {
        self.view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.placeholder = "Enter your password"
        
        let verticalConstraint = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: passwordLabel, attribute: .bottom, multiplier: 1, constant: 15)
        let leadingConstraint = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15)
        let trailingConstraint = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -15)
        let heightConstraint = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
        
        NSLayoutConstraint.activate([verticalConstraint, trailingConstraint, leadingConstraint, heightConstraint])
    }
    
    func setupLoginButton() {
        self.view.addSubview(loginButton)
        
         
        
        let verticalConstraint = NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: passwordTextField, attribute: .bottom, multiplier: 1, constant: 15)
        let heightConstraint = NSLayoutConstraint(item: loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        let widthConstraint = NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 240)
        let leadingConstraint = NSLayoutConstraint(item: loginButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15)
        let trailingConstraint = NSLayoutConstraint(item: loginButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -15)
        
        let horizontalConstraint = NSLayoutConstraint(item: loginButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([verticalConstraint, heightConstraint, widthConstraint, horizontalConstraint])
    }
    
    func setupSignInAppleButton() {
        self.view.addSubview(appleButton)
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        appleButton.tapped = {
            self.navigationController?.pushViewController(MultihreadingViewController(), animated: true)
        }
        
        let verticalConstraint = NSLayoutConstraint(item: appleButton, attribute: .top, relatedBy: .equal, toItem: loginButton, attribute: .bottom, multiplier: 1, constant: 15)
        let heightConstraint = NSLayoutConstraint(item: appleButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        let widthConstraint = NSLayoutConstraint(item: appleButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 240)
        let leadingConstraint = NSLayoutConstraint(item: appleButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15)
        let trailingConstraint = NSLayoutConstraint(item: appleButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -15)
        
        let horizontalConstraint = NSLayoutConstraint(item: appleButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([verticalConstraint, heightConstraint, widthConstraint, horizontalConstraint])
    }
    
    func setupOnboardingButton() {
        self.view.addSubview(onboardingButton)
        onboardingButton.setTitle("Onboarding", for: .normal)
        
        let verticalConstraint = NSLayoutConstraint(item: onboardingButton, attribute: .top, relatedBy: .equal, toItem: appleButton, attribute: .bottom, multiplier: 1, constant: 15)
        let heightConstraint = NSLayoutConstraint(item: onboardingButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        let widthConstraint = NSLayoutConstraint(item: onboardingButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 240)
        let leadingConstraint = NSLayoutConstraint(item: onboardingButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15)
        let trailingConstraint = NSLayoutConstraint(item: onboardingButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -15)
        
        let horizontalConstraint = NSLayoutConstraint(item: onboardingButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([verticalConstraint, heightConstraint, widthConstraint, horizontalConstraint])
    }
}



extension ViewController: UICollectionViewDelegate {
    // if the user clicks on a cell, display a message
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // the number of cells are wholly dependent on the number of colours
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeue the standard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let data = self.data[indexPath.item]
        cell.backgroundColor = data
        return cell
    }
}
