//
//  UILoadControl.swift
//  Swift_homework
//
//  Created by Ivan Ganchev on 03/02/2018.
//  Copyright © 2018 Ivan Ganchev. All rights reserved.
//

import UIKit

class UILoadControl: UIView {
    
    let oneSixthCricle = 1.047197551196598
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initParams()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initParams()
    }
    
    private func initParams() {
        loadXib()
        drawCircle()
        drawArc()
    }
    
    private func drawCircle() {
        let rect = CGRect(x: 0, y: 0, width: 300, height: 300)
        let circle = UIView(frame: rect)
        
        
        circle.backgroundColor = UIColor.white
        circle.layer.cornerRadius = (rect.width)/2
        circle.layer.borderColor = UIColor(red: 39/255, green: 182/255, blue: 238/255, alpha: 1.0).cgColor
        circle.layer.borderWidth = 10.0
        
        
        contentView.addSubview(circle)
        contentView.backgroundColor = UIColor.black
    }
    
    private func loadXib() {
        Bundle.main.loadNibNamed("UILoadControl", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func drawArcSegment(startAngle: Double, endAngle: Double, colour: UIColor) {
        let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 120, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        
        let arcLayer = CAShapeLayer()
        arcLayer.path = path.cgPath
    
        arcLayer.strokeColor = colour.cgColor
        arcLayer.fillColor = UIColor.white.cgColor
        arcLayer.lineWidth = 25
        arcLayer.position = contentView.center
        
        contentView.layer.addSublayer(arcLayer)
    }
    
    private func drawArc() {
        drawArcSegment(startAngle: 0, endAngle: oneSixthCricle, colour: UIColor(red: 221/255, green: 81/255, blue: 33/255, alpha: 1.0))
        
        drawArcSegment(startAngle: 2*oneSixthCricle, endAngle: 3*oneSixthCricle, colour: UIColor(red: 223/255, green: 233/255, blue: 235/255, alpha: 1.0))
        
        drawArcSegment(startAngle: 3*oneSixthCricle, endAngle: 4*oneSixthCricle, colour: UIColor(red: 37/255, green: 174/255, blue: 236/255, alpha: 1.0))
        
        drawArcSegment(startAngle: 4*oneSixthCricle, endAngle: 5*oneSixthCricle, colour: UIColor(red: 89/255, green: 139/255, blue: 152/255, alpha: 1.0))
        
        drawArcSegment(startAngle: 5*oneSixthCricle, endAngle: 6*oneSixthCricle, colour: UIColor(red: 186/255, green: 68/255, blue: 27/255, alpha: 1.0))
    }
}
