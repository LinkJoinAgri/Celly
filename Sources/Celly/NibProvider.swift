//
//  NibProvider.swift
//  
//
//  Created by scchn on 2023/2/4.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

public protocol NibProvider: AnyObject {
    #if os(macOS)
    static var nib: NSNib { get }
    #else
    static var nib: UINib { get }
    #endif
}

extension NibProvider {
    
    #if os(macOS)
    public static var nib: NSNib {
        let name = String(describing: self)
        let bundle = Bundle(for: self)
        
        guard let nib = NSNib(nibNamed: name, bundle: bundle) else {
            fatalError("⚠️ Failed to load nib \(name).")
        }
        
        return nib
    }
    #else
    public static var nib: UINib {
        let name = String(describing: self)
        let bundle = Bundle(for: self)
        return UINib(nibName: name, bundle: bundle)
    }
    #endif
    
}
