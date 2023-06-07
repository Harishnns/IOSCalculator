//
//  ViewController.swift
//  CalAssignment
//
//  Created by HARISH NOMULA on 06/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var OutputScreen: UILabel!
    
    @IBOutlet weak var OutputHistory: UITextView!
    
    var isAdvance: Bool = false
    
    var calculator = (UIApplication.shared.delegate as! AppDelegate).calculate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func NumClick(_ sender: UIButton) {
        var input : String = (sender.titleLabel?.text!)!
        OutputScreen.text?.append(input + " ")
        calculator.input = input
        calculator.push(v:input)
    }

    
    @IBAction func ClearClick(_ sender: Any) {
        OutputScreen.text=""
        calculator.list = [String]()
    }
  

    @IBAction func EqualClick(_ sender: UIButton) {
        var result = calculator.calculate()
        
        if result != 88888888{
            OutputScreen.text?.append("= ")
            OutputScreen.text?.append(String(result))
            calculator.list = [String]()
            
        }else {
            OutputScreen.text = "Input is not valid. Please try again."
        }
        
        if isAdvance == true{
            
            OutputHistory.text?.append(OutputScreen.text! + "\n")
            
            }
    }
    
   
    
    @IBAction func AdvClick(_ sender: UIButton) {
        if  isAdvance == false{
            sender.setTitle("Standard - No History", for: .normal)
            OutputHistory.backgroundColor = UIColor.lightGray
            OutputHistory.isEditable = false
            isAdvance = true
            
        } else{
            sender.setTitle("Advance - With History", for: .normal)
            OutputHistory.isEditable = false
            OutputHistory.backgroundColor = UIColor.white
            OutputHistory.text? = ""
            isAdvance = false
        }
    }
   
    
}
