//
//  ViewController.swift
//  Swift-Numbers-Only-Tutorial
//
//  Created by Rick Wilson on 4/14/15.
//  Copyright (c) 2015 Rick Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var NumbersOnlyTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        NumbersOnlyTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
            var result = true
            let prospectiveText = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
    
            if textField == NumbersOnlyTextField {
                if count(string) > 0 {
                    let disallowedCharacterSet = NSCharacterSet(charactersInString: "0123456789.").invertedSet
                    let replacementStringIsLegal = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
    
                    let resultingStringLengthIsLegal = count(prospectiveText) <= 9
    
                    let scanner = NSScanner(string: prospectiveText)
                    let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.atEnd
    
                    result = replacementStringIsLegal &&
                        resultingStringLengthIsLegal &&
                    resultingTextIsNumeric
                }
            }
            return result
        }


}

