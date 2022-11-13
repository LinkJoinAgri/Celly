//
//  NSCollectionView+Ext.swift
//  
//
//  Created by scchn on 2022/10/5.
//

#if os(macOS)

import AppKit

extension NSCollectionView {
    
    public func registerClass<T: NSCollectionViewItem & Reusable>(itemType: T.Type) {
        register(itemType.self, forItemWithIdentifier: .init(itemType.reuseIdentifier))
    }
    
    public func registerNib<T: NSCollectionViewItem & NibReusable>(itemType: T.Type) {
        register(itemType.nib, forItemWithIdentifier: .init(itemType.reuseIdentifier))
    }
    
    public func registerClass<T: NSView & Reusable>(supplementaryViewType: T.Type, kind: SupplementaryElementKind) {
        register(
            supplementaryViewType,
            forSupplementaryViewOfKind: kind,
            withIdentifier: .init(supplementaryViewType.reuseIdentifier)
        )
    }
    
    public func registerNib<T: NSView & NibReusable>(supplementaryViewType: T.Type, kind: SupplementaryElementKind) {
        register(
            supplementaryViewType.nib,
            forSupplementaryViewOfKind: kind,
            withIdentifier: .init(supplementaryViewType.reuseIdentifier)
        )
    }
    
    public func makeItem<T: NSCollectionViewItem & Reusable>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let item = makeItem(withIdentifier: .init(type.reuseIdentifier), for: indexPath) as? T else {
            fatalErrorCreatingReusable(type)
        }
        return item
    }
    
    public func makeSupplementaryView<T: NSView & Reusable>(ofType type: T.Type, kind: SupplementaryElementKind, for indexPath: IndexPath) -> T {
        guard let view = makeSupplementaryView(ofKind: kind, withIdentifier: .init(type.reuseIdentifier), for: indexPath) as? T else {
            fatalErrorCreatingReusable(type)
        }
        return view
    }
    
}

#endif
