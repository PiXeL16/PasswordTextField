//
//  PasswordRuleSpecs.swift
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
class PasswordRuleSpecs: QuickSpec {
    
    override func spec() {
       
        
        it("is valid with good password"){
            
            let passwordRule:PasswordRule = PasswordRule()
            
            let passwordString = "1234Abcd8988!"
            
            expect(passwordRule.validate(passwordString)).to(beTrue())
        }
        
        
        it("is invalid with shitty password"){
            
            let passwordRule:PasswordRule = PasswordRule()
            
            let passwordString = "love"
            
            expect(passwordRule.validate(passwordString)).to(beFalse())
        }
        
    }
    
}
