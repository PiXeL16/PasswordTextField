//
//  BundleUtilSpecs.swift
//  PasswordTextField
//
//  Created by Chris Jimenez on 2/12/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import Nimble
import Quick
import PasswordTextField

//Specs for the delayer class
class BundleUtilSpecs: QuickSpec {
    
    override func spec() {
        
        it("is not nil"){
            
            expect(BundleUtil.bundle).toNot(beNil())
        }
        
    }
    
}