//
//  SecureTextToggleButton.swift
//  PasswordTextField
//
//  Created by Chris Jimenez on 2/10/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation


/// The Segure text button toggle shown in the right side of the textfield
public class SecureTextToggleButton: UIButton {
    
    
    private let RightMargin:CGFloat = 10.0
    private let Width:CGFloat = 20.0
    private let Height:CGFloat = 20.0
    
    
    /// Sets the value for the secure or note secure toggle and
    dynamic public var isSecure:Bool = true{
        
        didSet{
            
            if isSecure{
                setVisibilityOn()
            }
            else
            {
                setVisibilityOff()
            }
        }
    }
    
    /// Image to shown when the visibility is on
    public var visibilityOnImage:UIImage = UIImage(named: "visibility_on", inBundle: NSBundle(forClass: PasswordTextField.self), compatibleWithTraitCollection: nil)!
    
    /// Image to shown when the visibility is off
    public var visibilityOffImage:UIImage = UIImage(named: "visibility_off", inBundle: NSBundle(forClass: PasswordTextField.self), compatibleWithTraitCollection: nil)!
    
    /// Tint of the image
    public var imageTint:UIColor = UIColor.grayColor(){
        didSet{
            self.tintColor = imageTint
        }
    }
    
   
    /**
     Convenience init that can be set to initialize the object with visible on image visible off image and image tint
     
     - parameter visibilityOnImage:  Visible on Image
     - parameter visibilityOffImage: Visible off Image
     - parameter imageTint:          The tint of the image
     
     - returns:
     */
    public convenience init(visibilityOnImage:UIImage = UIImage(named: "visibility_on", inBundle: NSBundle(forClass: PasswordTextField.self), compatibleWithTraitCollection: nil)! , visibilityOffImage:UIImage = UIImage(named: "visibility_off", inBundle: NSBundle(forClass: PasswordTextField.self), compatibleWithTraitCollection: nil)! , imageTint:UIColor = UIColor.grayColor())
    {
        self.init(frame:CGRectZero)
        
        self.visibilityOnImage = visibilityOnImage
        
        self.visibilityOffImage = visibilityOffImage

        self.imageTint = imageTint
    }
    
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        
    }
    
    public required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        setup()
        
    }

    
    /**
     Initialize properties and values
     */
    func setup()
    {
        
        //Initialize the frame and adds a right margin
        self.frame = CGRect(x: 0, y: -0, width: visibilityOnImage.size.width+RightMargin, height: visibilityOnImage.size.height)
        
        //Sets the tint color
        self.tintColor = imageTint
       
        //Sets the aspect fit of the image
        self.contentMode = UIViewContentMode.ScaleAspectFit
        self.backgroundColor = UIColor.clearColor()
        
        //Initialize the component with the secure state
        isSecure = true
        
        //Sets the button target
        self.addTarget(self, action: "buttonTouch", forControlEvents: .TouchUpInside)
        
    }
    
    /**
     Updates the image and the set the visibility on icon
     */
    func setVisibilityOn()
    {
        self.setImage(visibilityOnImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate),forState: .Normal)
    }
    
    
    /**
     Update teh image and sets the visibility off icon
     */
    func setVisibilityOff()
    {
        self.setImage(visibilityOffImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate),forState: .Normal)
    }
    
    /**
     Toggle the icon
     */
    func buttonTouch()
    {
        self.isSecure = !self.isSecure
    }
    
}


