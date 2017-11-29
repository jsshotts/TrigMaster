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
        view.backgroundColor? = UIColor.darkGray
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowQuizScene"{
        }
    }
    @IBAction func unwindToMain(segue: UIStoryboardSegue){
        
    }
    
}
