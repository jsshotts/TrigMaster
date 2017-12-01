//
//  ViewController.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/2/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var UnitCircleView: UnitCircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UnitCircleView.radius = (UnitCircleView.frame.size.height/2)/1.4
        UnitCircleView.setBackgroundColor()
        UnitCircleView.setLabelTextForFirstTime()
        UnitCircleView.isUserInteractionEnabled = true

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
