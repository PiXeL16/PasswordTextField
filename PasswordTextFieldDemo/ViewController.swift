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

    @IBOutlet weak var signInButton: UIButton!
        
    @IBOutlet weak var passwordTextField: PasswordTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sign In"
        
        self.signInButton.layer.cornerRadius = 8
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInTouched(_ sender: AnyObject) {
        
        if passwordTextField.isInvalid()
        {
            //Swhos the error if the password is invalid, as an example is using an alert view but you can show it anyway you want
            let alert = UIAlertController(title: "Alert", message: passwordTextField.errorMessage(), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}

