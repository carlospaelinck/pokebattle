//
//  Stats.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

struct Stats {
    let hitPoints: Int
    let attack: Int
    let defense: Int
    let specialAttack: Int
    let specialDefense: Int
    let speed: Int
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