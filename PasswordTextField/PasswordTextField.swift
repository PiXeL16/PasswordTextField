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
     Default initializer for the textfield
     
     - parameter frame: frame of the view
     
     - returns:
     */
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        
    }
    
    /**
     Default initializer for the textfield done from storyboard
     
     - parameter coder: coder
     
     - returns: 
     */
    public required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        setup()
        
    }
    
    
    /**
     Initialize properties and values
     */
    func setup()
    {
        
        self.secureTextEntry = true
    }
    
    
    /// retuns if the textfield is secure or not
    public var isSecure: Bool{
        get{
            return secureTextEntry
        }
    }
    
    /**
     Toggle the secure text view
     */
    public func toggleSecureText()
    {
    
       
        self.resignFirstResponder()
        self.secureTextEntry = !isSecure
        
        /// Kind of ugly hack to make the text refresh after the toggle. The size of the secure fonts are different than the normal ones and it shows trailing white space
        let tempText = self.text;
        self.text = " ";
        self.text = tempText;
        
        self.textColor = UIColor(white: 0.0, alpha: 1.0)
        
        self.becomeFirstResponder()
        
        
    }
    
    
}
