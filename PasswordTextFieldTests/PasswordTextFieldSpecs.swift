//
//  PasswordTextFieldSpecs.swift
//  PasswordTextField
//
//  Created by Chris Jimenez on 2/11/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import Nimble
import Quick
import PasswordTextField

//Specs for the delayer class
class PasswordTextFieldSpecs: QuickSpec {
    
    override func spec() {
        
        
        let passwordTextField = PasswordTextField()
        
        it("initial values are correct"){
            
            let passwordString = "1234Abcd8988!"
            
            passwordTextField.text = passwordString
            passwordTextField.imageTintColor = UIColor.red
            passwordTextField.setSecureMode(false)
            
            expect(passwordTextField.isValid()).to(beTrue())
            expect(passwordTextField.errorMessage()).toNot(beNil())
            expect(passwordTextField.showButtonWhile).to(equal(PasswordTextField.ShowButtonWhile.Editing))
            
            expect(passwordTextField.imageTintColor).to(equal(UIColor.red))
            expect(passwordTextField.secureTextButton.tintColor).to(equal(UIColor.red))
            expect(passwordTextField.isSecureTextEntry).to(beFalse())
            
        }
        
        it("values are correct after button pressed"){
            
            let passwordString = "love"
            
            passwordTextField.text = passwordString
            
            passwordTextField.secureTextButton.buttonTouch()
            
            expect(passwordTextField.isValid()).to(beFalse())
            expect(passwordTextField.errorMessage()).toNot(beNil())
            
            expect(passwordTextField.secureTextButton.isSecure).to(beFalse())
            expect(passwordTextField.isSecureTextEntry).to(beFalse())
            
        }
        
        
        it("validates with custom validator"){
            
            let passwordString = "LOVE"
            
            passwordTextField.text = passwordString
            
            let validationRule = RegexRule(regex:"^[A-Z ]+$", errorMessage: "test")
            
            passwordTextField.validationRule = validationRule
            
            expect(passwordTextField.isValid()).to(beTrue())
            expect(passwordTextField.errorMessage()).to(equal("test"))
            
        }

        
        
    }
    
}

