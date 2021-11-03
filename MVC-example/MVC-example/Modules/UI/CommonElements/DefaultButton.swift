//
//  DefaultButton.swift
//  MVC-example
//
//  Created by Roman Guseynov on 31.10.2021.
//

import Foundation
import UIKit

class DefaultButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColors.prussianBlue
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 8
        
        self.setTitle("Login", for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
