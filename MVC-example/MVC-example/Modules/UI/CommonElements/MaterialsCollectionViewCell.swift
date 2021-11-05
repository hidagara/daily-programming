//
//  MaterialsCollectionViewCell.swift
//  MVC-example
//
//  Created by Roman Guseynov on 04.11.2021.
//

import UIKit

class MaterialsCollectionViewCell: UICollectionViewCell {
    
    
    var textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        self.addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalConstraint = NSLayoutConstraint.init(item: textLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let horizontalConstraint = NSLayoutConstraint.init(item: textLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([verticalConstraint, horizontalConstraint])
        
        self.backgroundColor = AppColors.claret
        self.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configureCell(text: String) {
        self.textLabel.text = text
    }
    
    
}
