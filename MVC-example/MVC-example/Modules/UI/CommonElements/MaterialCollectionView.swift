//
//  MaterialCollectionView.swift
//  MVC-example
//
//  Created by Roman Guseynov on 01.11.2021.
//

import Foundation
import UIKit
class MaterialCollectionView: UICollectionView {
    
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
         // bounce at the bottom of the collection view
     self.alwaysBounceVertical = true
                // set the background to be white
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


extension MaterialCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           // dequeue the standard cell
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let data =  UIColor.red
           cell.backgroundColor = data
           return cell
       }
    
    
}

extension MaterialCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("SELE")
    }
}



class MyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
