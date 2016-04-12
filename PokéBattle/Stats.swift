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