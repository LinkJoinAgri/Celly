//
//  Base.swift
//  
//
//  Created by scchn on 2022/12/3.
//

import Foundation

func fatalErrorCreatingReusable<T: Reusable>(_ type: T.Type) -> Never {
    fatalError("⚠️ Failed to create \(type) for reuse identifier \(type.reuseIdentifier).")
}
