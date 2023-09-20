//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 06.03.2021.
//

import Foundation

/// Get the SPM Bundle
public final class BundleUtil: NSObject{
    
    /// Gets the bundle property for the spm module
    public static var bundle: Bundle{
        Bundle.module
    }
}
