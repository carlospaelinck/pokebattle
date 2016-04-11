//
//  Attack.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

enum AttackCategory {
    case Special, Physical, Status
}

struct Attack {
    let name: String
    let basePower: Int
    let type: PokémonType
    let category: AttackCategory
}