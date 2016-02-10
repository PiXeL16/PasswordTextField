//
//  ViewController.swift
//  PasswordTextFieldDemo
//
//  Created by Chris Jimenez on 2/9/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit
import PasswordTextField

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: PasswordTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test(sender: AnyObject) {
        
        passwordTextField.toggleSecureText()
    }

}

