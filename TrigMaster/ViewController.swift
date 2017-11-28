//
//  ViewController.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/2/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let canvasView = UnitCircleView(frame: CGRect(x:0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height/2))
        canvasView.radius = (self.view.frame.size.height/2)/2.4
        canvasView.setBackgroundColor()
        canvasView.setLabelTextForFirstTime()
        canvasView.isUserInteractionEnabled = true
        view.addSubview(canvasView)
        view.backgroundColor? = UIColor.purple
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowQuizScene"{
            //            let destination = segue.destination as? LearnViewController
            //
            //            let trigSet = ["sin", "cos", "tan", "csc", "sec", "cot"]
            //            let divisorSet = ["", "/3", "/4", "/6"]
            //            let π = Float.pi
            //            print (π)
            
            
            
            //            let value = Int(arc4random_uniform(20))
            //            let valueFloat = Float(value)
            //
            //            destination?.question = "\(trigSet[Int(arc4random_uniform(6))])  \(value)π\(divisorSet[Int(arc4random_uniform(4))])"
            //
            //            destination?.value = valueFloat
            //            destination?.valueInt = value
            //
            //            destination?.valueLocation = arc4random_uniform(4)
            
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
}

