//
//  UnitCircleView.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/2/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class UnitCircleView: UIView {
    
    var angle = CGFloat(0)
    
        {
        didSet{setNeedsDisplay()}
    }
    
    var radius = CGFloat(300)
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor.lightGray
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
        labelWidth.textColor = UIColor.blue
        
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
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.strokePath()
        
        context?.move(to: CGPoint(x: x2, y: centery))
        context?.addLine(to: CGPoint(x: x2, y: CGFloat(self.frame.size.height) - y2))
        
        context?.setStrokeColor(UIColor.magenta.cgColor)
        context?.strokePath()
        
        context?.move(to: CGPoint(x: x2, y: CGFloat(self.frame.size.height) - y2))
        context?.addLine(to: CGPoint(x: centerx, y: centery))
        
        context?.setStrokeColor(UIColor.black.cgColor)
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
//
//        if angle > (5*CGFloat.pi)/2{
//            labelHeight.center.x = x2 + self.frame.size.width/16
//        }
//        if angle >= (7*CGFloat.pi)/2{
//            labelHeight.center.x = x2 + self.frame.size.width/16
//        }
//
//        if angle > (9*CGFloat.pi)/2{
//            labelHeight.center.x = x2 + self.frame.size.width/16
//        }
//        if angle >= (11*CGFloat.pi)/2{
//            labelHeight.center.x = x2 + self.frame.size.width/16
//        }
        labelHeight.center.y = ((CGFloat(self.frame.size.height) - y2) + centery)/2
        
        labelAngle.center.x = centerx + (centerx + x2)/15
        if angle >= CGFloat.pi{
            labelAngle.center.x = centerx - (centerx + x2)/20
        }
//        if angle > 2*CGFloat.pi{
//            labelAngle.center.x = centerx - (centerx + x2)/20
//        }
//        if angle >= 3*CGFloat.pi{
//            labelAngle.center.x = centerx - (centerx + x2)/20
//        }
//        if angle > 4*CGFloat.pi{
//            labelAngle.center.x = centerx - (centerx + x2)/20
//        }
//        if angle >= 5*CGFloat.pi{
//            labelAngle.center.x = centerx - (centerx + x2)/20
//        }
//        if angle > 6*CGFloat.pi{
//            labelAngle.center.x = centerx - (centerx + x2)/20
//        }

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
    
    func moveLabels(y: CGFloat){
        
        self.labelWidth.center.y = self.labelWidth.center.y + y
        self.labelHeight.center.y = self.labelHeight.center.y + y
        self.labelAngle.center.y = self.labelHeight.center.y + y
        
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
