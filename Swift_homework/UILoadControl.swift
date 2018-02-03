//
//  UILoadControl.swift
//  Swift_homework
//
//  Created by Ivan Ganchev on 03/02/2018.
//  Copyright © 2018 Ivan Ganchev. All rights reserved.
//

import UIKit

class UILoadControl: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
        initParams()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXib()
        initParams()
    }
    
    private func initParams() {
        let rect = CGRect(x: 0, y: 0, width: 300, height: 300)
        let circle = UIView(frame: rect)
        circle.backgroundColor = UIColor.blue
        circle.layer.cornerRadius = (rect.width)/2
        contentView.addSubview(circle)
    }
    
    private func loadXib() {
        Bundle.main.loadNibNamed("UILoadControl", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
