//
//  Ruleable.swift
//  PasswordTextField
//
//  Created by Chris Jimenez on 2/11/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

/**
 *  Protocol that represent something that conforms to a Rule
 */
public protocol Ruleable {
    func validate(_ value: String) -> Bool
    func errorMessage() -> String
}
