//
//  MultihreadingViewController.swift
//  MVC-example
//
//  Created by Roman Guseynov on 31.10.2021.
//

import UIKit

class MultihreadingViewController: UIViewController {
    
    var patternsLabel = UILabel()
    var GCDLabel = UILabel()
    var asyncAwaitLabel = UILabel()



    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.gainsboro
        setupPatternsLabel()
        setupGCDLabel()
        setupAsyncAwaitLabel()
    }
    
    
    func setupPatternsLabel() {
        self.view.addSubview(patternsLabel)

        patternsLabel.translatesAutoresizingMaskIntoConstraints = false
        patternsLabel.font = UIFont(name: "Nunito-Regular", size: 24)
        

        patternsLabel.text = "Multithreading Patterns"


        let horizontalConstraint = NSLayoutConstraint(item: patternsLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 15)
        let verticalConstraint = NSLayoutConstraint(item: patternsLabel, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
    
    func setupGCDLabel() {
        self.view.addSubview(GCDLabel)

        GCDLabel.translatesAutoresizingMaskIntoConstraints = false
        GCDLabel.font = UIFont(name: "Nunito-Regular", size: 24)
        

        GCDLabel.text = "Grand Central Dispatch"


        let horizontalConstraint = NSLayoutConstraint(item: GCDLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 15)
        let verticalConstraint = NSLayoutConstraint(item: GCDLabel, attribute: .top, relatedBy: .equal, toItem: self.patternsLabel, attribute: .bottom, multiplier: 1, constant: 10)

        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
    
    func setupAsyncAwaitLabel() {
        self.view.addSubview(asyncAwaitLabel)

        asyncAwaitLabel.translatesAutoresizingMaskIntoConstraints = false
        asyncAwaitLabel.font = UIFont(name: "Nunito-Regular", size: 24)
        

        asyncAwaitLabel.text = "Async Await API"


        let horizontalConstraint = NSLayoutConstraint(item: asyncAwaitLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 15)
        let verticalConstraint = NSLayoutConstraint(item: asyncAwaitLabel, attribute: .top, relatedBy: .equal, toItem: self.GCDLabel, attribute: .bottom, multiplier: 1, constant: 10)

        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
