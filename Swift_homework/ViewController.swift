//
//  ViewController.swift
//  Swift_homework
//
//  Created by Ivan Ganchev on 03/02/2018.
//  Copyright © 2018 Ivan Ganchev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loadControl: UILoadControl!
    
    var percentage: Double = 0
    
    @objc func updatePercentage() {
        if (percentage == 100) {
            return
        }
        percentage += 1
        loadControl.setPercentage(percentageEntered: percentage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        
        let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updatePercentage), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

