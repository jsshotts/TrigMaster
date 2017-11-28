//
//  IncorrectViewController.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/18/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class IncorrectViewController: UIViewController {
    
    var angle = CGFloat(0)
    var labelText = ""

    @IBOutlet weak var Incorrect: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var UnitCircleView: UnitCircleView!
    
    @IBAction func arrowPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UnitCircleView.radius = (UnitCircleView.frame.size.height/2)/1.2
        UnitCircleView.angle = angle
        UnitCircleView.setBackgroundColor()
        UnitCircleView.setLabelTextForFirstTime()
        UnitCircleView.isUserInteractionEnabled = false
        
//        print(UnitCircleView.angle)
//        if UnitCircleView.angle.truncatingRemainder(dividingBy: 2*CGFloat.pi) > 2{
//            UnitCircleView.angle = UnitCircleView.angle - (2*CGFloat.pi)
//            print(UnitCircleView.angle)
//            if UnitCircleView.angle.truncatingRemainder(dividingBy: 2*CGFloat.pi) > 2{
//                UnitCircleView.angle = UnitCircleView.angle - (2*CGFloat.pi)
//                print(UnitCircleView.angle)
//                if UnitCircleView.angle.truncatingRemainder(dividingBy: 2*CGFloat.pi) > 2{
//                    UnitCircleView.angle = UnitCircleView.angle - (2*CGFloat.pi)
//                    print(UnitCircleView.angle)
//                }
//            }
//        }
        questionLabel.text = labelText
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
 

}
