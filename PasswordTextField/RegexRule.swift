//
//  RegexRule.swift
//  PasswordTextField
//
//  Created by Chris Jimenez on 2/11/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

/// Basic structure that represent a Regex Rule
public class RegexRule : Ruleable {
    
    /// Default regex
    private var REGEX: String = "^(?=.*?[A-Z]).{8,}$"
    /// Error message
    private var message : String
    
    
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
    public func validate(value: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", self.REGEX)
        return test.evaluateWithObject(value)
    }
    
    /**
     Returns the error message
     
     - returns: <#return value description#>
     */
    public func errorMessage() -> String {
        return message
    }
    
    
    
}