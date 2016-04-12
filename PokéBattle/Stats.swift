//
//  Stats.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

class Stats: NSObject, NSCoding {
    var hitPoints: Int
    var attack: Int
    var defense: Int
    var specialAttack: Int
    var specialDefense: Int
    var speed: Int

    init(hitPoints: Int, attack: Int, defense: Int, specialAttack: Int, specialDefense: Int, speed: Int) {
        self.hitPoints = hitPoints
        self.attack = attack
        self.defense = defense
        self.specialAttack = specialAttack
        self.specialDefense = specialDefense
        self.speed = speed
    }

    required init?(coder aDecoder: NSCoder) {
        hitPoints = aDecoder.decodeObjectForKey("hitPoints") as! Int
        attack = aDecoder.decodeObjectForKey("attack") as! Int
        defense = aDecoder.decodeObjectForKey("defense") as! Int
        specialAttack = aDecoder.decodeObjectForKey("specialAttack") as! Int
        specialDefense = aDecoder.decodeObjectForKey("specialDefense") as! Int
        speed = aDecoder.decodeObjectForKey("speed") as! Int
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(hitPoints, forKey: "hitPoints")
        aCoder.encodeObject(attack, forKey: "attack")
        aCoder.encodeObject(defense, forKey: "defense")
        aCoder.encodeObject(specialAttack, forKey: "specialAttack")
        aCoder.encodeObject(specialDefense, forKey: "specialDefense")
        aCoder.encodeObject(speed, forKey: "speed")
    }
}

internal var StatsZero: Stats {
    get {
        return Stats(
            hitPoints: 0,
            attack: 0,
            defense: 0,
            specialAttack: 0,
            specialDefense: 0,
            speed: 0
        )
    }
}

internal var PerfectIVsStats: Stats {
    get {
        return Stats(
            hitPoints: 31,
            attack: 31,
            defense: 31,
            specialAttack: 31,
            specialDefense: 31,
            speed: 31
        )
    }
}