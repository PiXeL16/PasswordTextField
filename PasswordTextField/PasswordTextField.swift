//
//  PasswordTextField.swift
//  PasswordTextField
//
//  Created by Chris Jimenez on 2/9/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit

//  A custom TextField with a switchable icon which shows or hides the password
public class PasswordTextField: UITextField {
    
    private var kvoContext: UInt8 = 0
    
    
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
        self.autocapitalizationType = .None
        self.autocorrectionType = .No
        self.keyboardType = .ASCIICapable
        self.rightViewMode = .WhileEditing
        self.rightView = self.secureTextButton
        
        self.secureTextButton.addObserver(self, forKeyPath: "isSecure", options: NSKeyValueObservingOptions.New, context: &kvoContext)
    }
    
    /**
     The color of the image.
     
     This property applies a color to the image. The default value for this property is gray.
     */
    @IBInspectable dynamic public var imageTintColor: UIColor = UIColor.grayColor() {
        didSet {
            
            self.secureTextButton.tintColor = imageTintColor
        }
    }

    
    /// retuns if the textfield is secure or not
    public var isSecure: Bool{
        get{
            return secureTextEntry
        }
    }
    
    private lazy var secureTextButton: SecureTextToggleButton = {
        
        return SecureTextToggleButton(imageTint: self.imageTintColor)
        
    }()
    
    /**
     Toggle the secure text view
     */
    public func setSecureText(secure:Bool)
    {
    
        self.resignFirstResponder()
        self.secureTextEntry = secure
        
        /// Kind of ugly hack to make the text refresh after the toggle. The size of the secure fonts are different than the normal ones and it shows trailing white space
        let tempText = self.text;
        self.text = " ";
        self.text = tempText;
        
        self.textColor = UIColor(white: 0.0, alpha: 1.0)
        
        self.becomeFirstResponder()
        
    }
    
    
    public override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if context == &kvoContext {
            
            
            if context == &kvoContext {
                
                self.setSecureText(self.secureTextButton.isSecure)
                
                
            } else {
                super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
            }
        }
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "isSecure")
    }
    
    
}
