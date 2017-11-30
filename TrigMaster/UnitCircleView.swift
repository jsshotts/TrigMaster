//
//  UnitCircleView.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/2/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class UnitCircleView: UIView {
    
    let angleSet = ["0", "π/6", "π/4", "π/3", "π/2", "5π/6", "3π/4", "2π/3", "π", "7π/6", "5π/4", "4π/3", "3π/2", "11π/6", "7π/4", "5π/3"]
    let lengthSet = ["0", "1/2", "√2/2", "√3/2", "1"]
    
    var angle = CGFloat(0)
    
        {
        didSet{setNeedsDisplay()}
    }
    
    var radius = CGFloat(300)
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor.clear
    }
    
    let labelHeight = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 15))
    let labelWidth = UILabel(frame: CGRect(x: 20, y: 40, width: 50, height: 15))
    let labelAngle = UILabel(frame: CGRect(x: 20, y: 60, width: 50, height: 15))

    func setLabelTextForFirstTime() {
        
        labelWidth.text = "\(abs(cos(angle)))"
        if abs(cos(angle)) < 0.000001{
            labelWidth.text = "0"
            labelHeight.text = "1"
        }
        labelWidth.textColor = UIColor.cyan
        
        labelHeight.text = "\(abs(sin(angle)))"
        if abs(sin(angle)) < 0.000001{
            labelHeight.text = "0"
            labelWidth.text = "1"
        }
        labelHeight.textColor = UIColor.magenta
        
        labelAngle.text = "\(angle)"
        if angle == 0.0{
            labelAngle.text = "0"
        }
        labelAngle.textColor = UIColor.orange
        
        checkToSnap()
        
        self.addSubview(labelWidth)
        self.addSubview(labelHeight)
        self.addSubview(labelAngle)
    }
    
    func drawUnitCircle() {
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.addArc(center: CGPoint(x:self.frame.size.width/2, y:self.frame.size.height/2), radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.strokePath()
        
    }
    
    func drawLines() {
        
        let centerx = CGFloat(self.frame.size.width/2)
        let centery = CGFloat(self.frame.size.height/2)
        
        
        let x2 = (radius * cos(angle)) + centerx
        let y2 = (radius * sin(angle)) + centery
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: centerx, y: centery))
        context?.addLine(to: CGPoint(x: x2, y: centery))
        context?.setStrokeColor(UIColor.cyan.cgColor)
        context?.strokePath()
        
        context?.move(to: CGPoint(x: x2, y: centery))
        context?.addLine(to: CGPoint(x: x2, y: CGFloat(self.frame.size.height) - y2))
        
        context?.setStrokeColor(UIColor.magenta.cgColor)
        context?.strokePath()
        
        context?.move(to: CGPoint(x: x2, y: CGFloat(self.frame.size.height) - y2))
        context?.addLine(to: CGPoint(x: centerx, y: centery))
        
        context?.setStrokeColor(UIColor.orange.cgColor)
        context?.strokePath()
        
        labelWidth.center.x = (centerx + x2)/2
        labelWidth.center.y = centery + centery/15
        
        labelHeight.center.x = x2 + self.frame.size.width/13
        if angle > CGFloat.pi/2{
            labelHeight.center.x = x2 - self.frame.size.width/13
        }
        if angle >= (3*CGFloat.pi)/2{
            labelHeight.center.x = x2 + self.frame.size.width/16
        }
        if angle == (CGFloat.pi){
            labelHeight.center.x = x2
        }
        
        labelHeight.center.y = ((CGFloat(self.frame.size.height) - y2) + centery)/2
        
        labelAngle.center.x = centerx + (centerx + x2)/15
        if angle >= CGFloat.pi{
            labelAngle.center.x = centerx - (centerx + x2)/20
        }

        labelAngle.center.y = centery - self.frame.size.height/40
        
    }
    
    func drawSmallCircle(){
        
        let centerx = CGFloat(self.frame.size.width/2)
        let centery = CGFloat(self.frame.size.height/2)
        
        let x2 = (radius * cos(angle)) + centerx
        let y2 = (radius * sin(angle)) + centery
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.addArc(center: CGPoint(x: x2, y: CGFloat(self.frame.size.height) - y2), radius: 4, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.strokePath()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let position = touch?.location(in: self)
        let xdistance = position!.x - self.frame.size.width/2
        let ydistance = -(position!.y - self.frame.size.height/2)
        angle = atan2(ydistance, xdistance)

        
        if cos(angle) >= 0{
            if cos(angle) < 0.00000000001{
                self.labelWidth.text = "0"
                self.labelHeight.text = "1"
            }
            else{
                self.labelWidth.text = "\(abs(cos(angle)))"
            }
        }
        if cos(angle) < 0{
            if cos(angle) > -0.000000000001{
                self.labelWidth.text = "0"
                self.labelHeight.text = "1"
            }
            else{
                self.labelWidth.text = "\(abs(cos(angle)))"
            }
        }
        if sin(angle) >= 0{
            if sin(angle) < 0.00000000001{
                self.labelHeight.text = "0"
                self.labelWidth.text = "1"
            }
            else{
                self.labelHeight.text = "\(abs(sin(angle)))"
            }
        }
        if sin(angle) < 0{
            if sin(angle) > -0.00000000001{
                self.labelHeight.text = "0"
                self.labelWidth.text = "1"
            }
            else{
                self.labelHeight.text = "\(abs(sin(angle)))"
            }
        }
        if angle < 0 {
            angle = angle + 2*CGFloat.pi
        }
        self.labelAngle.text = "\(angle)"
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let position = touch?.location(in: self)
        let xdistance = position!.x - self.frame.size.width/2
        let ydistance = -(position!.y - self.frame.size.height/2)
        angle = atan2(ydistance, xdistance)

        self.labelWidth.text = "\(abs(cos(angle)))"
        self.labelHeight.text = "\(abs(sin(angle)))"
        
        if angle < 0 {
            angle = angle + 2*CGFloat.pi
        }
        self.labelAngle.text = "\(angle)"
        
        checkToSnap()
    }
    
    func snapAngle(desiredAngle: CGFloat){
        
        if angle < desiredAngle + 0.1{
            if angle > desiredAngle - 0.1{
            self.angle = desiredAngle
            }
        }
        
        print(desiredAngle)
    
        if angle < 0.0 + 0.09{
            if self.angle > 0.0 - 0.09{
                self.labelAngle.text  = angleSet[0]
                self.labelWidth.text = lengthSet[4]
                self.labelHeight.text = lengthSet[0]
            }
        }
        if angle < CGFloat.pi/6 + 0.09{
            if angle > CGFloat.pi/6 - 0.09{
                self.labelAngle.text = angleSet[1]
                self.labelWidth.text = lengthSet[3]
                self.labelHeight.text = lengthSet[1]
            }
        }
        if angle < CGFloat.pi/4 + 0.09{
            if angle > CGFloat.pi/4 - 0.09{
                self.labelAngle.text = angleSet[2]
                self.labelWidth.text = lengthSet[2]
                self.labelHeight.text = lengthSet[2]
            }
        }
        if angle < CGFloat.pi/3 + 0.09{
            if angle > CGFloat.pi/3 - 0.09{
                self.labelAngle.text = angleSet[3]
                self.labelWidth.text = lengthSet[1]
                self.labelHeight.text = lengthSet[3]
            }
        }
        if angle < CGFloat.pi/2 + 0.09{
            if angle > CGFloat.pi/2 - 0.09{
                self.labelAngle.text = angleSet[4]
                self.labelWidth.text = lengthSet[0]
                self.labelHeight.text = lengthSet[4]
            }
        }
        if angle < 5*CGFloat.pi/6 + 0.09{
            if angle > 5*CGFloat.pi/6 - 0.09{
                self.labelAngle.text = angleSet[5]
                self.labelWidth.text = lengthSet[3]
                self.labelHeight.text = lengthSet[1]
            }
        }
        if angle < 3*CGFloat.pi/4 + 0.09{
            if angle > 3*CGFloat.pi/4 - 0.09{
                self.labelAngle.text = angleSet[6]
                self.labelWidth.text = lengthSet[2]
                self.labelHeight.text = lengthSet[2]
            }
        }
        if angle < 2*CGFloat.pi/3 + 0.09{
            if angle > 2*CGFloat.pi/3 - 0.09{
                self.labelAngle.text = angleSet[7]
                self.labelWidth.text = lengthSet[1]
                self.labelHeight.text = lengthSet[3]
            }
        }
        if angle < CGFloat.pi + 0.09{
            if angle > CGFloat.pi - 0.09 {
                self.labelAngle.text = angleSet[8]
                self.labelWidth.text = lengthSet[4]
                self.labelHeight.text = lengthSet[0]
            }
        }
        if angle < 7*CGFloat.pi/6 + 0.09{
            if angle > 7*CGFloat.pi/6 - 0.09 {
                self.labelAngle.text = angleSet[9]
                self.labelWidth.text = lengthSet[3]
                self.labelHeight.text = lengthSet[1]
            }
        }
        if angle < 5*CGFloat.pi/4 + 0.09{
            if angle > 5*CGFloat.pi/4 - 0.09 {
                self.labelAngle.text = angleSet[10]
                self.labelWidth.text = lengthSet[2]
                self.labelHeight.text = lengthSet[2]
            }
        }
        if angle < 4*CGFloat.pi/3 + 0.09{
            if angle > 4*CGFloat.pi/3 - 0.09 {
                self.labelAngle.text = angleSet[11]
                self.labelWidth.text = lengthSet[1]
                self.labelHeight.text = lengthSet[3]
            }
        }
        if angle < 3*CGFloat.pi/2 + 0.09{
            if angle > 3*CGFloat.pi/2 - 0.09 {
                self.labelAngle.text = angleSet[12]
                self.labelWidth.text = lengthSet[0]
                self.labelHeight.text = lengthSet[1]
            }
        }
        if angle < 11*CGFloat.pi/6 + 0.09{
            if angle > 11*CGFloat.pi/6 - 0.09 {
                self.labelAngle.text = angleSet[13]
                self.labelWidth.text = lengthSet[3]
                self.labelHeight.text = lengthSet[1]
            }
        }
        if angle < 7*CGFloat.pi/4 + 0.09{
            if angle > 7*CGFloat.pi/4 - 0.09 {
                self.labelAngle.text = angleSet[14]
                self.labelWidth.text = lengthSet[2]
                self.labelHeight.text = lengthSet[2]
            }
        }
        if angle < 5*CGFloat.pi/3 + 0.09{
            if angle > 5*CGFloat.pi/3 - 0.09 {
                self.labelAngle.text = angleSet[15]
                self.labelWidth.text = lengthSet[1]
                self.labelHeight.text = lengthSet[3]
            }
        }
    }
    
    func checkToSnap(){
        
//        snapAngle(desiredAngle: -0.0)
//        snapAngle(desiredAngle: -CGFloat.pi/6)
//        snapAngle(desiredAngle: -CGFloat.pi/4)
//        snapAngle(desiredAngle: -CGFloat.pi/3)
//        snapAngle(desiredAngle: -CGFloat.pi/2)
//        snapAngle(desiredAngle: -5*CGFloat.pi/6)
//        snapAngle(desiredAngle: -3*CGFloat.pi/4)
//        snapAngle(desiredAngle: -2*CGFloat.pi/3)
//        snapAngle(desiredAngle: -CGFloat.pi)
        
        snapAngle(desiredAngle: 0.0)
        snapAngle(desiredAngle: CGFloat.pi/6)
        snapAngle(desiredAngle: CGFloat.pi/4)
        snapAngle(desiredAngle: CGFloat.pi/3)
        snapAngle(desiredAngle: CGFloat.pi/2)
        snapAngle(desiredAngle: 5*CGFloat.pi/6)
        snapAngle(desiredAngle: 3*CGFloat.pi/4)
        snapAngle(desiredAngle: 2*CGFloat.pi/3)
        snapAngle(desiredAngle: CGFloat.pi)
        
        
        snapAngle(desiredAngle: 7*CGFloat.pi/6)
        snapAngle(desiredAngle: 5*CGFloat.pi/4)
        snapAngle(desiredAngle: 4*CGFloat.pi/3)
        snapAngle(desiredAngle: 3*CGFloat.pi/2)
        snapAngle(desiredAngle: 11*CGFloat.pi/6)
        snapAngle(desiredAngle: 7*CGFloat.pi/4)
        snapAngle(desiredAngle: 5*CGFloat.pi/3)
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        drawUnitCircle()
        drawLines()
        drawSmallCircle()

    }
}
