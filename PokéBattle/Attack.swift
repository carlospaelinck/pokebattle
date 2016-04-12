//
//  Attack.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

enum AttackCategory: Int {
    case Special = 1, Physical, Status
}

class Attack {
    let name: String
    let basePower: Int
    let type: PokémonType
    let category: AttackCategory
    let learnset: [Int]

    init(name: String, basePower: Int, type: PokémonType, category: AttackCategory, learnset: [Int]) {
        self.name = name
        self.basePower = basePower
        self.type = type
        self.category = category
        self.learnset = learnset
    }
}