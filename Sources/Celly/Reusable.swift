//
//  Reusable.swift
//  
//
//  Created by scchn on 2023/2/4.
//

import Foundation

public protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
    
}

public typealias NibReusable = NibProvider & Reusable
