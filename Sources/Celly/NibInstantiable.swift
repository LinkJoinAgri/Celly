//
//  NibInstantiable.swift
//  
//
//  Created by scchn on 2022/10/5.
//

#if !os(macOS)

import UIKit

public protocol NibInstantiable: NibProvider {
    
}

extension NibInstantiable {
    
    public static func instantiateFromNib() -> Self where Self: UIView {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("⚠️ Failed to load view from \(Self.nib).")
        }
        return view
    }
    
}

#endif
