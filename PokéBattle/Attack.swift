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

class Attack: NSObject, NSCoding {
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

    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        basePower = aDecoder.decodeObjectForKey("basePower") as! Int
        learnset = aDecoder.decodeObjectForKey("learnset") as! [Int]

        let typeValue = aDecoder.decodeObjectForKey("type") as! String
        type = PokémonType(rawValue: typeValue)!

        let categoryValue = aDecoder.decodeObjectForKey("category") as! Int
        category = AttackCategory(rawValue: categoryValue)!
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(basePower, forKey: "basePower")
        aCoder.encodeObject(learnset, forKey: "learnset")
        aCoder.encodeObject(type.rawValue, forKey: "type")
        aCoder.encodeObject(category.rawValue, forKey: "category")
    }
}

internal var EmptyAttack: Attack {
    get {
        return Attack(name: "—", basePower: 0, type: .None, category: .Status, learnset: [])
    }
}