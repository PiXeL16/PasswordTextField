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
        case Never = "never"
        
        var textViewMode: UITextFieldViewMode {
            switch self{
                
            case .Editing:
                return UITextFieldViewMode.WhileEditing
            
            case .Always:
                return UITextFieldViewMode.Always
                
            case .Never:
                return UITextFieldViewMode.Never
                
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
    
    /// The rule to apply to the validation password rule
    public var validationRule:RegexRule = PasswordRule()
    
    
    /**
     *  Shows the toggle button while editing, never, or always. The possible values to set are "editing", "never", "always
     */
    @available(*, unavailable, message="This property is reserved for Interface Builder. Use 'showButtonWhile' instead.")
    @IBInspectable var showToggleButtonWhile: String? {
        willSet {
            if let newShow = ShowButtonWhile(rawValue: newValue?.lowercaseString ?? "") {
                self.showButtonWhile = newShow
            }
        }
    }
    
    /// Convenience var to change teh border width
    @IBInspectable  dynamic public var borderWidth: CGFloat = 0 { didSet { self.layer.borderWidth = borderWidth } }
    /// Convenience var to change the corner radius
    @IBInspectable dynamic public var cornerRadius: CGFloat = 0 { didSet { self.layer.cornerRadius = cornerRadius } }
    
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
    
    public lazy var secureTextButton: SecureTextToggleButton = {
        
        return SecureTextToggleButton(imageTint: self.imageTintColor)
        
    }()
    
    /**
     Toggle the secure text view or not
     */
    public func setSecureMode(secure:Bool)
    {
    
        self.resignFirstResponder()
        self.secureTextEntry = secure
        
        /// Kind of ugly hack to make the text refresh after the toggle. The size of the secure fonts are different than the normal ones and it shows trailing white space
        let tempText = self.text;
        self.text = " ";
        self.text = tempText;
        
        self.becomeFirstResponder()
        
    }
    
    /**
     Checks if the password typed is valid
     
     - returns: valid password of not
     */
    public func isValid() -> Bool{
        
        var returnValue = false
        
        if let text = self.text{
            returnValue = validationRule.validate(text)
        }
        
        return returnValue
    }
    
    /**
     Convenience function to check if the validation is invalid
     
     - returns: true if the validation is invalid
     */
    public func isInvalid() ->Bool {
        
        return !isValid()
    }
    
    /**
     Returns the error message of the validation rule setted
     
     - returns: error message
     */
    public func errorMessage() -> String{
        
        return validationRule.errorMessage()
    }
    
    
    public override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if context == &kvoContext {
            
            
            if context == &kvoContext {
                
                self.setSecureMode(self.secureTextButton.isSecure)
                
                
            } else {
                super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
            }
        }
    }
    
    deinit {
        self.secureTextButton.removeObserver(self, forKeyPath: "isSecure")
    }
    
    
}
