//
//  PasswordTextField.swift
//  PasswordTextField
//
//  Created by Chris Jimenez on 2/9/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit

//  A custom TextField with a switchable icon which shows or hides the password
@IBDesignable public class PasswordTextField: UITextField {
    
    /**
     Sets the text to secure or not
     */
    public var secureText: Bool?{
        didSet {
            if let secureText = secureText
            {
                self.secureTextEntry = secureText
            }
        }
    }
    
    
}
