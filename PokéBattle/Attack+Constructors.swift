//
//  Attack+Constructors.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

extension Attack {
    static func Scald() -> Attack {
        return Attack(
            name: "Scald",
            basePower: 80,
            type: .Water,
            category: .Special
        )
    }
}