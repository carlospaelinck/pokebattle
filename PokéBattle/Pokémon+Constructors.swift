//
//  Pokémon+Extension.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

extension Pokémon {
    static func Greninja() -> Pokémon {
        return Pokémon(
            id: 658,
            name: "Greninja",
            types: [.Water, .Dark],
            stats: Stats(
                hitPoints: 72,
                attack: 95,
                defense: 67,
                specialAttack: 103,
                specialDefense: 71,
                speed: 122
            )
        )
    }

    static func Chandelure() -> Pokémon {
        return Pokémon(
            id: 609,
            name: "Chandelure",
            types: [.Ghost, .Fire],
            stats: Stats(
                hitPoints: 60,
                attack: 55,
                defense: 90,
                specialAttack: 145,
                specialDefense: 90,
                speed: 80
            )
        )
    }

    static func Blastoise() -> Pokémon {
        return Pokémon(
            id: 9,
            name: "Blastoise",
            types: [.Water],
            stats: Stats(
                hitPoints: 79,
                attack: 83,
                defense: 100,
                specialAttack: 85,
                specialDefense: 105,
                speed: 78
            )
        )
    }
}