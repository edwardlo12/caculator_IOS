//
//  ViewController.swift
//  caculator
//
//  Created by 羅仕昌 on 2017/3/27.
//  Copyright © 2017年 羅仕昌. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var op: Double = 0
    var setZero: Bool = true
    var operand: Double = 0
    var dot:Bool=false
    var dotN:Double=1
    
    
   
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numPress(_ sender: AnyObject) {
       
        let alertController = UIAlertController(title: "\(sender.tag!)", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        alertController.addTextField { (textfield:UITextField!) -> Void in
            textfield.placeholder = "請輸入"
            self.resultLabel.text = textfield.text
        }
        self.present(alertController, animated: true, completion: nil)
        
        if setZero {
            
            resultLabel.text = "0"
            setZero = false
            dot=false
            dotN=1
            
        }
        if dot{
            
                var result: Double = Double(resultLabel.text!)!
                dotN = dotN*0.1
                result = result + Double(sender.tag!)*dotN
                resultLabel.text = "\(result)"
            
        
        }
        else{
            var result: Double = Double(resultLabel.text!)!
            result = result*10 + Double(sender.tag!)
            
            resultLabel.text = "\(result)"
        }

    }
    @IBAction func operand(_ sender: AnyObject) {
    if op != 0 {
        
        operand = calculateResult(oprtr: op)
        resultLabel.text = "\(operand)"
        setZero = true
        dot=false
        dotN=1
        op = Double(sender.tag)
        }
    else{
        let res: Double = Double(resultLabel.text!)!
        operand = res
        setZero = true
        dot=false
        dotN=1
        op = Double(sender.tag)
        }

    }
    
    func calculateResult(oprtr: Double) -> Double {
        
        var returnValue: Double = Double(resultLabel.text!)!
        switch (oprtr) {
        case 1:
            returnValue = operand + returnValue
            break
        case 2:
            returnValue = operand - returnValue
            break
        case 3:
            returnValue = operand * returnValue
            break
        case 4:
            returnValue = operand / returnValue
            break
        default:
            break
        }
        return returnValue
        
    }

    @IBAction func equal(_ sender: AnyObject) {
        operand = calculateResult(oprtr: op)
        resultLabel.text = "\(operand)"
        op = 0
        setZero = true
        dot=false
        dotN=1
    }
    
    @IBAction func abs(_ sender: AnyObject) {
        var result: Double = Double(resultLabel.text!)!
        result = result * -1
        resultLabel.text = "\(result)"
    }
    @IBAction func percent(_ sender: AnyObject) {
        var result: Double = Double(resultLabel.text!)!
        result = result * 0.01
        resultLabel.text = "\(result)"
    }

    @IBAction func dotPress(_ sender: AnyObject) {
        dot=true
    }
    
    @IBAction func clear(_ sender: AnyObject) {
        resultLabel.text = "0"
        dot=false
        dotN=1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "0"
        setZero = true
        op = 0
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

