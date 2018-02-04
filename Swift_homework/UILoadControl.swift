//
//  UILoadControl.swift
//  Swift_homework
//
//  Created by Ivan Ganchev on 03/02/2018.
//  Copyright © 2018 Ivan Ganchev. All rights reserved.
//

import UIKit

class UILoadControl: UIView {
    
    let oneSixthCricle = (2*Double.pi) / 6
    var percentage: Double = 0
    var arrowLayer: CAShapeLayer = CAShapeLayer()
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initParams(percentageEntered: self.percentage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initParams(percentageEntered: self.percentage)
    }
    
    private func initParams(percentageEntered: Double) {
        loadXib()
        drawCircle()
        drawArc()
        drawArrow(percentage: percentageEntered)
        drawLabels()
    }
    
    func setPercentage(percentageEntered: Double) {
        self.percentage = percentageEntered
        removeArrow()
        drawArrow(percentage: percentageEntered)
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
    
    private func createArrowPath(startAngle: Double, endAngle: Double) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 20, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        
        let start = path.currentPoint
        path.close()
        let end = path.currentPoint
        
        var vector = CGVector(dx: start.x - end.x, dy: start.y - end.y)
        let dist = sqrt(vector.dx*vector.dx + vector.dy*vector.dy)
        vector.dx /= dist
        vector.dy /= dist
        
        let endPointX = start.x - 100*vector.dy
        let endPointY = start.y + 100*vector.dx
        let endPoint = CGPoint(x: endPointX, y: endPointY)
        
        path.move(to: CGPoint(x: start.x, y: start.y))
        path.addLine(to: endPoint)
        path.addLine(to: CGPoint(x: end.x, y: end.y))
        
        return path
    }
    
    private func drawArrow(percentage: Double) {
        
        let wholeBarLength = oneSixthCricle*5
        let onePercentFromBar = wholeBarLength/100
        let moveArrowBy = percentage*onePercentFromBar + oneSixthCricle/11
        
        arrowLayer.path = createArrowPath(startAngle: (2*oneSixthCricle + oneSixthCricle/2)+moveArrowBy, endAngle: (oneSixthCricle + oneSixthCricle/2)+moveArrowBy).cgPath
        
        arrowLayer.strokeColor = UIColor(red: 37/255, green: 174/255, blue: 236/255, alpha: 1.0).cgColor
        arrowLayer.fillColor = UIColor(red: 37/255, green: 174/255, blue: 236/255, alpha: 1.0).cgColor
        arrowLayer.position = contentView.center
        
        contentView.layer.addSublayer(arrowLayer)
    }
    
    private func removeArrow() {
        arrowLayer.removeFromSuperlayer()
    }
    
    private func drawLabel(text: String, x: Double, y: Double) {
        let label = UILabel(frame: CGRect(x: x, y: y, width: 50, height: 50))
        
        label.center = CGPoint(x: x, y: y)
        label.textAlignment = .center
        label.textColor = UIColor.darkGray
        label.text = "\(text)"
        
        contentView.addSubview(label)
    }
    
    private func drawLabels() {
        drawLabel(text: "0", x: 102, y: 235)
        drawLabel(text: "20", x: 60, y: 147)
        drawLabel(text: "40", x: 105, y: 70)
        drawLabel(text: "60", x: 195, y: 70)
        drawLabel(text: "80", x: 242, y: 147)
        drawLabel(text: "100", x: 195, y: 230)
    }
}
