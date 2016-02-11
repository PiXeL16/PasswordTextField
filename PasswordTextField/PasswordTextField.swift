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
    
    //KVO Context
    private var kvoContext: UInt8 = 0
    
    /// Enums with the values of when to show the secure or insecure text button
    public enum ShowButtonWhile: String {
        case Editing = "editing"
        case Always = "always"
        
        var textViewMode: UITextFieldViewMode {
            switch self{
            case .Editing:
                return UITextFieldViewMode.WhileEditing
            
            case .Always:
                return UITextFieldViewMode.Always
            }
        }
    }

    
    /**
     Default initializer for the textfield
     
     - parameter frame: fra me of the view
     
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
    
    /// When to show the button defaults to only when editing
    public var showButtonWhile = ShowButtonWhile.Editing{
        
        didSet{
             self.rightViewMode = self.showButtonWhile.textViewMode
        }
            
    }
    
    
    @available(*, unavailable, message="This property is reserved for Interface Builder. Use 'showButtonWhile' instead.")
    @IBInspectable var showToggleButtonWhile: String? {
        willSet {
            if let newShow = ShowButtonWhile(rawValue: newValue?.lowercaseString ?? "") {
                self.showButtonWhile = newShow
            }
        }
    }
    
    /**
     The color of the image.
     
     This property applies a color to the image. The default value for this property is gray.
     */
    @IBInspectable public var imageTintColor: UIColor = UIColor.grayColor() {
        didSet {
            
            self.secureTextButton.tintColor = imageTintColor
        }
    }
    
    
    /**
     The image to show the secure text
     */
    @IBInspectable public var customShowSecureTextImage: UIImage? {
        
        didSet{
            
            if let image = customShowSecureTextImage
            {
                self.secureTextButton.showSecureTextImage = image
            }
        }
    }
    
    
    /**
     The image to hide the secure text
     */
    @IBInspectable public var customHideSecureTextImage: UIImage? {
        
        didSet{
            
            if let image = customHideSecureTextImage
            {
                self.secureTextButton.hideSecureTextImage = image
            }
            
        }
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
        self.rightViewMode = self.showButtonWhile.textViewMode
        self.rightView = self.secureTextButton
        
        self.secureTextButton.addObserver(self, forKeyPath: "isSecure", options: NSKeyValueObservingOptions.New, context: &kvoContext)
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
