//
//  SecureTextToggleButton.swift
//  PasswordTextField
//
//  Created by Chris Jimenez on 2/10/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import QuartzCore


/// The Segure text button toggle shown in the right side of the textfield
open class SecureTextToggleButton: UIButton {
    
    
    fileprivate let RightMargin:CGFloat = 10.0
    fileprivate let Width:CGFloat = 20.0
    fileprivate let Height:CGFloat = 20.0
    
    /// Sets the value for the secure or note secure toggle and
    dynamic open var isSecure:Bool = true{
        
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
    open var showSecureTextImage:UIImage = UIImage(named: "visibility_on", in:BundleUtil.bundle, compatibleWith: nil)!{
        
        didSet{
            self.setImage(showSecureTextImage.withRenderingMode(UIImageRenderingMode.alwaysTemplate),for: UIControlState())
        }
            
    }
    
    /// Image to shown when the visibility is off
    open var hideSecureTextImage:UIImage = UIImage(named: "visibility_off", in:BundleUtil.bundle, compatibleWith: nil)!
    
    
    /// Tint of the image
    open var imageTint:UIColor = UIColor.gray{
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
    public convenience init(showSecureTextImage:UIImage = UIImage(named: "visibility_on", in:BundleUtil.bundle, compatibleWith: nil)! , hideSecureTextImage:UIImage = UIImage(named: "visibility_off", in: BundleUtil.bundle, compatibleWith: nil)! , imageTint:UIColor = UIColor.gray)
    {
        self.init(frame:CGRect.zero)
        
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
        self.contentMode = UIViewContentMode.scaleAspectFit
        self.backgroundColor = UIColor.clear
        
        //Initialize the component with the secure state
        isSecure = true
        
        //Sets the button target
        self.addTarget(self, action: #selector(SecureTextToggleButton.buttonTouch), for: .touchUpInside)
    }
    
    /**
     Updates the image and the set the visibility on icon
     */
    func setVisibilityOn()
    {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {() -> Void in
            self.alpha = 0.1
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {() -> Void in
                self.alpha = 1
            }, completion: {(_ finished: Bool) -> Void in
                UIView.transition(with: self, duration: 0.25, options: [.transitionFlipFromBottom, .curveEaseInOut], animations: {() -> Void in
                }, completion: nil)
            })
        })
        
        self.setImage(showSecureTextImage.withRenderingMode(UIImageRenderingMode.alwaysTemplate),for: UIControlState())
    }
    
    
    /**
     Update teh image and sets the visibility off icon
     */
    func setVisibilityOff()
    {
        UIView.transition(with: self, duration: 0.25, options: [.transitionFlipFromTop], animations: {() -> Void in
        }, completion: nil)
        
        self.setImage(hideSecureTextImage.withRenderingMode(UIImageRenderingMode.alwaysTemplate),for: UIControlState())
    }
    
    /**
     Toggle the icon
     */
    open func buttonTouch()
    {
//        //for zoom in
//        UIView.animate(withDuration: 0.5, animations: {() -> Void in
//                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            }, completion: {(_ finished: Bool) -> Void in
//        })
//        // for zoom out
//        UIView.animate(withDuration: 0.5, animations: {() -> Void in
//                self.transform = CGAffineTransform(scaleX: 1, y: 1)
//            }, completion: {(_ finished: Bool) -> Void in
//        })
        
        self.isSecure = !self.isSecure
    }
}


