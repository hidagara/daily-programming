//
//  ViewController.swift
//  MVC-example
//
//  Created by Roman Guseynov on 28.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var loginTextField = UITextField()
    var loginLabel = UILabel()
    var passwordTextField = UITextField()
    var passwordLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.gainsboro
        // Do any additional setup after loading the view.
        setupLoginLabel()
        setupLoginTextField()
        setupPasswordLabel()
        setupPasswordTextField()
    }
    
    func setupLoginLabel() {
        self.view.addSubview(loginLabel)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "Login"
        loginLabel.font = UIFont.systemFont(ofSize: 24)
        loginLabel.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let horizontalConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 15)
        let verticalConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
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
        
        let widthConstraint = NSLayoutConstraint(item: loginTextField, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: loginTextField, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
        NSLayoutConstraint.activate([trailingConstraint, leadingConstraint, verticalConstraint,heightConstraint,])
    }
    
    
    func setupPasswordLabel() {
        self.view.addSubview(passwordLabel)
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 24)
        passwordLabel.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let horizontalConstraint = NSLayoutConstraint(item: passwordLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 15)
        let verticalConstraint = NSLayoutConstraint(item: passwordLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: loginTextField, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 15)
        let widthConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
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
}

