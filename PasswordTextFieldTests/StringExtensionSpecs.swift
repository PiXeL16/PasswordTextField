//
//  StringExtensionSpecs.swift
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
class StringExtensionSpecs: QuickSpec {
    
    override func spec() {
    
        it("is not empty"){
            
            let value = "Not an empty string"
        
            expect(value.isNotEmpty).to(beTrue())
        }
        
    }
    
}

