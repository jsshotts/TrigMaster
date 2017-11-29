//
//  CorrectViewController.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/18/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class CorrectViewController: UIViewController {

    var angle = CGFloat(0)
    var labelText = ""

    @IBOutlet weak var Correct: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var UnitCircleView: UnitCircleView!
    
    @IBAction func arrowPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UnitCircleView.radius = (UnitCircleView.frame.size.height/2)/1.2
        
        UnitCircleView.angle = angle
        UnitCircleView.angle = UnitCircleView.angle.truncatingRemainder(dividingBy: 2*CGFloat.pi)
        
        UnitCircleView.setBackgroundColor()
        UnitCircleView.setLabelTextForFirstTime()
        view.backgroundColor? = UIColor.darkGray
        UnitCircleView.isUserInteractionEnabled = false
        questionLabel.text = labelText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
