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
    
    @IBOutlet weak var questionLabel: UILabel!

    
    @IBOutlet weak var button1: UIButton!
    
    @IBAction func button1Pressed(_ sender: Any) {
        
        if button1.titleLabel?.text == ("\(tempAnswer)"){

            performSegue(withIdentifier: "ShowCorrectScene", sender: nil)
        }
        if button1.titleLabel?.text != ("\(tempAnswer)"){
            
            performSegue(withIdentifier: "ShowIncorrectScene", sender: nil)
        }
    
    }
    
    
    @IBOutlet weak var button2: UIButton!
    
    @IBAction func button2Pressed(_ sender: Any) {
        if button2.titleLabel?.text == ("\(tempAnswer)"){

            performSegue(withIdentifier: "ShowCorrectScene", sender: nil)
        }
        if button2.titleLabel?.text != ("\(tempAnswer)"){

            performSegue(withIdentifier: "ShowIncorrectScene", sender: nil)
        }
    }
    
    
    @IBOutlet weak var button3: UIButton!
    
    @IBAction func button3Pressed(_ sender: Any) {
        if button3.titleLabel?.text == ("\(tempAnswer)"){

            performSegue(withIdentifier: "ShowCorrectScene", sender: nil)
        }
        if button3.titleLabel?.text != ("\(tempAnswer)"){
  
            performSegue(withIdentifier: "ShowIncorrectScene", sender: nil)
        }
    }
    
    @IBOutlet weak var button4: UIButton!
    
    @IBAction func button4Pressed(_ sender: Any) {
        if button4.titleLabel?.text == ("\(tempAnswer)"){

            performSegue(withIdentifier: "ShowCorrectScene", sender: nil)
        }
        if button4.titleLabel?.text != ("\(tempAnswer)"){
     
            performSegue(withIdentifier: "ShowIncorrectScene", sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        questionLabel.text = question
        
        var buttonSet = [button1, button2, button3, button4]
        var tempAnswerSet = answerSet

//        print (tempAnswer)
//        print ("rounded: \(round(tempAnswer))")
        
        
        buttonSet[Int(valueLocation)]!.setTitle("\(tempAnswer)", for: UIControlState.normal)
        buttonSet.remove(at: Int(valueLocation))
            
        let button1tempAnswerIndex = Int(arc4random_uniform(15))
        buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
        tempAnswerSet.remove(at: button1tempAnswerIndex)

        let button2tempAnswerIndex = Int(arc4random_uniform(14))
        buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
        tempAnswerSet.remove(at: button2tempAnswerIndex)
            
        let button3tempAnswerIndex = Int(arc4random_uniform(13))
        buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)

        
//        if tempAnswer == 1.0{
//
//            print ("if statement()")
//
//            buttonSet[Int(valueLocation)]!.setTitle("1", for: UIControlState.normal)
//            buttonSet.remove(at: Int(valueLocation))
//            tempAnswerSet.remove(at: 0)
//            print(tempAnswerSet)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//            print(tempAnswerSet)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//            print(tempAnswerSet)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//            print(tempAnswerSet)
//        }
//        if tempAnswer == -1.0{
//
//            buttonSet[Int(valueLocation)]!.setTitle("-1", for: UIControlState.normal)
//            buttonSet.remove(at: Int(valueLocation))
//            tempAnswerSet.remove(at: 1)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if tempAnswer <= 0.0{
//            if tempAnswer > -0.00000000000001{
//                buttonSet[Int(valueLocation)]!.setTitle("0", for: UIControlState.normal)
//                buttonSet.remove(at: Int(valueLocation))
//                tempAnswerSet.remove(at: 2)
//
//                let button1tempAnswerIndex = Int(arc4random_uniform(15))
//                buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//                tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//                let button2tempAnswerIndex = Int(arc4random_uniform(14))
//                buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//                tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//                let button3tempAnswerIndex = Int(arc4random_uniform(13))
//                buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//            }
//        }
//        if tempAnswer >= 0.0{
//            if tempAnswer < 0.00000000000001{
//
//                buttonSet[Int(valueLocation)]!.setTitle("0", for: UIControlState.normal)
//                buttonSet.remove(at: Int(valueLocation))
//                tempAnswerSet.remove(at: 2)
//
//                let button1tempAnswerIndex = Int(arc4random_uniform(15))
//                buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//                tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//                let button2tempAnswerIndex = Int(arc4random_uniform(14))
//                buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//                tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//                let button3tempAnswerIndex = Int(arc4random_uniform(13))
//                buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//            }
//        }
//        if tempAnswer == 0.5{
//
//            buttonSet[Int(valueLocation)]!.setTitle("1/2", for: UIControlState.normal)
//            buttonSet.remove(at: Int(valueLocation))
//            tempAnswerSet.remove(at: 3)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if tempAnswer == -0.5{
//
//            buttonSet[Int(valueLocation)]!.setTitle("-1/2", for: UIControlState.normal)
//            buttonSet.remove(at: Int(valueLocation))
//            tempAnswerSet.remove(at: 4)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if round(tempAnswer) == round(sqrt(2)/2){
//
//            buttonSet[Int(valueLocation)]!.setTitle("sqrtf(2)/2", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 5)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if round(tempAnswer) == -round(sqrt(2)/2){
//
//            buttonSet[Int(valueLocation)]!.setTitle("-sqrtf(2)/2", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 6)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if round(tempAnswer) == round(sqrt(3)/2){
//
//            buttonSet[Int(valueLocation)]!.setTitle("sqrtf(3)/2", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 7)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if round(tempAnswer) == -round(sqrt(3)/2){
//
//            buttonSet[Int(valueLocation)]!.setTitle("-sqrtf(3)/2", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 8)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if tempAnswer > 10000.0{
//
//            buttonSet[Int(valueLocation)]!.setTitle("undefined", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 9)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//
//        }
//        if tempAnswer < -10000.0{
//
//            buttonSet[Int(valueLocation)]!.setTitle("undefined", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 9)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if tempAnswer == 2.0{
//
//            buttonSet[Int(valueLocation)]!.setTitle("2", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 10)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if tempAnswer == -2.0{
//
//            buttonSet[Int(valueLocation)]!.setTitle("-2", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 11)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if round(tempAnswer) == round(2.0/sqrt(2)){
//
//            buttonSet[Int(valueLocation)]!.setTitle("2/sqrt(2)", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 12)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if round(tempAnswer) == -round(2.0/sqrt(2)){
//
//            buttonSet[Int(valueLocation)]!.setTitle("-2/sqrt(2)", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 13)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if round(tempAnswer) == round(2.0/sqrt(3)){
//
//            buttonSet[Int(valueLocation)]!.setTitle("2/sqrt(3)", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 14)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
//        if round(tempAnswer) == -round(2.0/sqrt(3)){
//
//            buttonSet[Int(valueLocation)]!.setTitle("-2/sqrt(3)", for: UIControlState.normal)
//            tempAnswerSet.remove(at: 15)
//
//            let button1tempAnswerIndex = Int(arc4random_uniform(15))
//            buttonSet[0]!.setTitle(tempAnswerSet[button1tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button1tempAnswerIndex)
//
//            let button2tempAnswerIndex = Int(arc4random_uniform(14))
//            buttonSet[1]!.setTitle(tempAnswerSet[button2tempAnswerIndex], for: UIControlState.normal)
//            tempAnswerSet.remove(at: button2tempAnswerIndex)
//
//            let button3tempAnswerIndex = Int(arc4random_uniform(13))
//            buttonSet[2]!.setTitle(tempAnswerSet[button3tempAnswerIndex], for: UIControlState.normal)
//        }
 
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//
//        tempTrigFunc = trigSet[Int(arc4random_uniform(6))]
//        tempDivisor = divisorSet[Int(arc4random_uniform(10))]
//
//        let number = Int(arc4random_uniform(10))
//        let numberFloat = CGFloat(number)
//
//        question = "\(tempTrigFunc)  \(number)π\(tempDivisor)"
//
//        if number == 0 {
//            question = "\(tempTrigFunc) 0"
//        }
//        if number == 1 {
//            question = "\(tempTrigFunc) π\(tempDivisor)"
//        }
//
//
//
//        //divisor check
//        if tempDivisor == divisorSet[0]{
//            angle = numberFloat * π
//        }
//        if tempDivisor == divisorSet[1]{
//            angle = numberFloat/2
//        }
//        if tempDivisor == divisorSet[2]{
//            angle = numberFloat/3
//        }
//        if tempDivisor == divisorSet[4]{
//            angle = numberFloat/4
//        }
//        if tempDivisor == divisorSet[7]{
//            angle = numberFloat/6
//        }
//
//
//
//        //temporary answer
//        if tempTrigFunc == trigSet[0]{
//            tempAnswer = sin(angle)
//        }
//        if tempTrigFunc == trigSet[1]{
//            tempAnswer = cos(angle)
//        }
//        if tempTrigFunc == trigSet[2]{
//            tempAnswer = tan(angle)
//        }
//        if tempTrigFunc == trigSet[3]{
//            tempAnswer = 1/sin(angle)
//        }
//        if tempTrigFunc == trigSet[4]{
//            tempAnswer = 1/cos(angle)
//        }
//        if tempTrigFunc == trigSet[5]{
//            tempAnswer = 1/tan(angle)
//        }
//
//
//        valueLocation = arc4random_uniform(4)
//        print(tempTrigFunc)
//        print(tempAnswer)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            destination?.labelText = "\(question) = \(tempAnswer)"
        }
        
        if segue.identifier == "ShowCorrectScene" {
            
            let destination = segue.destination as? CorrectViewController
            
            destination?.angle = angle
            destination?.labelText = "\(question) = \(tempAnswer)"
        }

    }
 

}
