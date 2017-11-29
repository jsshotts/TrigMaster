//
//  LearnViewController.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/18/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {
    
    var question = ""
    var angle = CGFloat(0)

    var valueLocation: UInt32 = 0
    
    let trigSet = ["sin", "cos", "tan", "csc", "sec", "cot"]
    let divisorSet = ["", "/2", "/3", "/3", "/4", "/4", "/4", "/6", "/6", "/6"]
    let π = CGFloat.pi
    
    let answerSet = ["1", "-1", "0", "1/2", "-1/2", "sqrt(2)/2", "-sqrt(2)/2", "sqrt(3)/2", "-sqrt(3)/2", "undefined", "2", "-2", "2/sqrt(2)", "-2/sqrt(2)", "2/sqrt(3)", "-2/sqrt(3)"]
    var tempTrigFunc = ""
    var tempDivisor = ""
    var tempAnswer = CGFloat(0)
    var tempAnswerString = ""
    
    @IBOutlet weak var questionLabel: UILabel!

    
    @IBOutlet weak var button1: UIButton!
    
    @IBAction func button1Pressed(_ sender: Any) {
        
        if button1.titleLabel?.text == ("\(tempAnswerString)"){

            performSegue(withIdentifier: "ShowCorrectScene", sender: nil)
        }
        if button1.titleLabel?.text != ("\(tempAnswerString)"){
            
            performSegue(withIdentifier: "ShowIncorrectScene", sender: nil)
        }
    
    }
    
    
    @IBOutlet weak var button2: UIButton!
    
    @IBAction func button2Pressed(_ sender: Any) {
        if button2.titleLabel?.text == ("\(tempAnswerString)"){

            performSegue(withIdentifier: "ShowCorrectScene", sender: nil)
        }
        if button2.titleLabel?.text != ("\(tempAnswerString)"){

            performSegue(withIdentifier: "ShowIncorrectScene", sender: nil)
        }
    }
    
    
    @IBOutlet weak var button3: UIButton!
    
    @IBAction func button3Pressed(_ sender: Any) {
        if button3.titleLabel?.text == ("\(tempAnswerString)"){

            performSegue(withIdentifier: "ShowCorrectScene", sender: nil)
        }
        if button3.titleLabel?.text != ("\(tempAnswerString)"){
  
            performSegue(withIdentifier: "ShowIncorrectScene", sender: nil)
        }
    }
    
    @IBOutlet weak var button4: UIButton!
    
    @IBAction func button4Pressed(_ sender: Any) {
        if button4.titleLabel?.text == ("\(tempAnswerString)"){

            performSegue(withIdentifier: "ShowCorrectScene", sender: nil)
        }
        if button4.titleLabel?.text != ("\(tempAnswerString)"){
     
            performSegue(withIdentifier: "ShowIncorrectScene", sender: nil)
        }
    }
    
    func setButtons(answerIndex: Int){
        
        var buttonSet = [button1, button2, button3, button4]
        var tempAnswerSet = answerSet
        tempAnswerString = tempAnswerSet[answerIndex]
        
        buttonSet[Int(valueLocation)]!.setTitle("\(tempAnswerString)", for: UIControlState.normal)
        buttonSet.remove(at: Int(valueLocation))
        
        
        tempAnswerSet.remove(at: answerIndex)
        
        let button1tempAnswerIndex = Int(arc4random_uniform(15))
        buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
        tempAnswerSet.remove(at: button1tempAnswerIndex)
        
        let button2tempAnswerIndex = Int(arc4random_uniform(14))
        buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
        tempAnswerSet.remove(at: button2tempAnswerIndex)
        
        let button3tempAnswerIndex = Int(arc4random_uniform(13))
        buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        questionLabel.text = question

        
        if tempAnswer < -2.01{
            setButtons(answerIndex: 9)
        } else if tempAnswer < -1.42{
            setButtons(answerIndex: 11)
        } else if tempAnswer < -1.16{
            setButtons(answerIndex: 13)
        } else if tempAnswer < -1.001{
            setButtons(answerIndex: 15)
        } else if tempAnswer < -0.867{
            setButtons(answerIndex: 1)
        } else if tempAnswer < -0.708{
            setButtons(answerIndex: 8)
        } else if tempAnswer < -0.51{
            setButtons(answerIndex: 6)
        } else if tempAnswer < -0.01{
            setButtons(answerIndex: 4)
        } else if tempAnswer < 0.498{
            setButtons(answerIndex: 2)
        } else if tempAnswer < 0.706{
            setButtons(answerIndex: 3)
        } else if tempAnswer < 0.865{
            setButtons(answerIndex: 5)
        } else if tempAnswer < 0.900{
            setButtons(answerIndex: 7)
        } else if tempAnswer < 1.153{
            setButtons(answerIndex: 0)
        } else if tempAnswer < 1.413{
            setButtons(answerIndex: 14)
        } else if tempAnswer < 1.998{
            setButtons(answerIndex: 12)
        } else if tempAnswer < 2.99{
            setButtons(answerIndex: 10)
        } else{
            setButtons(answerIndex: 9)
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {

        tempTrigFunc = trigSet[Int(arc4random_uniform(6))]
        tempDivisor = divisorSet[Int(arc4random_uniform(10))]
        
        let number = Int(arc4random_uniform(10))
        let numberFloat = CGFloat(number)
        
        question = "\(tempTrigFunc) \(number)π\(tempDivisor)"
        
        
        if number == 0 {
            question = "\(tempTrigFunc) 0"
        }
        if number == 1 {
            question = "\(tempTrigFunc) π\(tempDivisor)"
        }
        
        
        if tempDivisor == divisorSet[0]{
            angle = numberFloat * π
            
        }
        if tempDivisor == divisorSet[1]{
            angle = (numberFloat * π)/2
            
        }
        if tempDivisor == divisorSet[2]{
            angle = (numberFloat *  π)/3
            
        }
        if tempDivisor == divisorSet[4]{
            angle = (numberFloat * π)/4
            
        }
        if tempDivisor == divisorSet[7]{
            angle = (numberFloat * π)/6
            
        }
        
        
        
        if tempTrigFunc == trigSet[0]{
            tempAnswer = sin(angle)
        }
        if tempTrigFunc == trigSet[1]{
            tempAnswer = cos(angle)
        }
        if tempTrigFunc == trigSet[2]{
            tempAnswer = sin(angle)/cos(angle)
        }
        if tempTrigFunc == trigSet[3]{
            tempAnswer = 1/(sin(angle))
        }
        if tempTrigFunc == trigSet[4]{
            tempAnswer = 1/(cos(angle))
        }
        if tempTrigFunc == trigSet[5]{
            tempAnswer = cos(angle)/sin(angle)
        }
        
        
        valueLocation = arc4random_uniform(4)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor? = UIColor.darkGray
        tempTrigFunc = trigSet[Int(arc4random_uniform(6))]
        tempDivisor = divisorSet[Int(arc4random_uniform(10))]

        let number = Int(arc4random_uniform(10))
        let numberFloat = CGFloat(number)

        question = "\(tempTrigFunc) \(number)π\(tempDivisor)"


        if number == 0 {
            question = "\(tempTrigFunc) 0"
        }
        if number == 1 {
            question = "\(tempTrigFunc) π\(tempDivisor)"
        }


        if tempDivisor == divisorSet[0]{
            angle = numberFloat * π

        }
        if tempDivisor == divisorSet[1]{
            angle = (numberFloat * π)/2

        }
        if tempDivisor == divisorSet[2]{
            angle = (numberFloat *  π)/3

        }
        if tempDivisor == divisorSet[4]{
            angle = (numberFloat * π)/4

        }
        if tempDivisor == divisorSet[7]{
            angle = (numberFloat * π)/6

        }



        if tempTrigFunc == trigSet[0]{
            tempAnswer = sin(angle)
        }
        if tempTrigFunc == trigSet[1]{
            tempAnswer = cos(angle)
        }
        if tempTrigFunc == trigSet[2]{
            tempAnswer = sin(angle)/cos(angle)
        }
        if tempTrigFunc == trigSet[3]{
            tempAnswer = 1/(sin(angle))
        }
        if tempTrigFunc == trigSet[4]{
            tempAnswer = 1/(cos(angle))
        }
        if tempTrigFunc == trigSet[5]{
            tempAnswer = cos(angle)/sin(angle)
        }


        valueLocation = arc4random_uniform(4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowIncorrectScene" {
            
            let destination = segue.destination as? IncorrectViewController
            
            destination?.angle = angle
            destination?.labelText = "\(question) = \(tempAnswerString)"
        }
        
        if segue.identifier == "ShowCorrectScene" {
            
            let destination = segue.destination as? CorrectViewController
            
            destination?.angle = angle
            destination?.labelText = "\(question) = \(tempAnswerString)"
        }

    }
 
    @IBAction func unwindToQuestion(segue: UIStoryboardSegue){
        
    }

}
