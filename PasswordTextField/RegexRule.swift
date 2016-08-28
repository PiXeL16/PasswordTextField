//
//  RegexRule.swift
//  PasswordTextField
//
//  Created by Chris Jimenez on 2/11/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

/// Basic structure that represent a Regex Rule
open class RegexRule : Ruleable {
    
    /// Default regex
    fileprivate var REGEX: String = "^(?=.*?[A-Z]).{8,}$"
    /// Error message
    fileprivate var message : String
    
    
    /**
     Default constructor
     
     - parameter regex:   regex of the rule
     - parameter message: errorMessage
     
     - returns: <#return value description#>
     */
    public init(regex: String, errorMessage: String = "Invalid Regular Expression"){
        self.REGEX = regex
        self.message = errorMessage
    }
    
    /**
     Validates if the rule works matches
     
     - parameter value: String value to validate againts a rule
     
     - returns: if the rule is valid or not
     */
    open func validate(_ value: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", self.REGEX)
        return test.evaluate(with: value)
    }
    
    /**
     Returns the error message
     
     - returns: <#return value description#>
     */
    open func errorMessage() -> String {
        return message
    }
    
    
    
}
