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
    public var showSecureTextImage:UIImage = UIImage(named: "visibility_on", inBundle:BundleUtil.bundle, compatibleWithTraitCollection: nil)!{
        
        didSet{
            self.setImage(showSecureTextImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate),forState: .Normal)
        }
            
    }
    
    /// Image to shown when the visibility is off
    public var hideSecureTextImage:UIImage = UIImage(named: "visibility_off", inBundle:BundleUtil.bundle, compatibleWithTraitCollection: nil)!
    
    
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
    public convenience init(showSecureTextImage:UIImage = UIImage(named: "visibility_on", inBundle:BundleUtil.bundle, compatibleWithTraitCollection: nil)! , hideSecureTextImage:UIImage = UIImage(named: "visibility_off", inBundle: BundleUtil.bundle, compatibleWithTraitCollection: nil)! , imageTint:UIColor = UIColor.grayColor())
    {
        self.init(frame:CGRectZero)
        
        self.showSecureTextImage = showSecureTextImage
        
        self.hideSecureTextImage = hideSecureTextImage

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
        self.frame = CGRect(x: 0, y: -0, width: showSecureTextImage.size.width+RightMargin, height: showSecureTextImage.size.height)
        
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
        self.setImage(showSecureTextImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate),forState: .Normal)
    }
    
    
    /**
     Update teh image and sets the visibility off icon
     */
    func setVisibilityOff()
    {
        self.setImage(hideSecureTextImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate),forState: .Normal)
    }
    
    /**
     Toggle the icon
     */
    public func buttonTouch()
    {
        self.isSecure = !self.isSecure
    }
    
}


