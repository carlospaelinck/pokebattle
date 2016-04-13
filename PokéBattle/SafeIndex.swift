//
//  SafeIndex.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/13/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

public extension CollectionType {
    subscript(safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}