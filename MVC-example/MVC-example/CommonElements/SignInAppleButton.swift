//
//  SignInAppleButton.swift
//  MVC-example
//
//  Created by Roman Guseynov on 31.10.2021.
//

import Foundation
import UIKit
class SignInAppleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "SIWA-Left-Black-Large"), for: .normal)
        
        self.layer.cornerRadius = 8
        self.setTitle("Sign in with Apple", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setTitleShadowColor(AppColors.prussianBlue, for: .normal)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
