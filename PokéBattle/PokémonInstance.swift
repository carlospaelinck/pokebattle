//
//  PokémonInstance.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

struct PokémonInstance: CustomStringConvertible {
    let basePokemon: Pokémon
    let level: Int
    let nature: Nature
    let IVs: Stats
    let EVs: Stats

    var hitPoints: Double {
        let base = 2 * Double(basePokemon.stats.hitPoints) + Double(IVs.hitPoints) + floor(Double(EVs.hitPoints) / 4.0)
        return floor((floor(base * Double(level)) / 100) + Double(level) + 10.0)
    }

    var attack: Double {
        let natureMultiplier: Double

        switch nature {
        case .Adamant, .Brave, .Lonely, .Naughty:
            natureMultiplier = 1.1

        case .Bold, .Modest, .Calm, .Timid:
            natureMultiplier = 0.9

        default: natureMultiplier = 1
        }

        let base = 2 * Double(basePokemon.stats.attack) + Double(IVs.attack) + floor(Double(EVs.attack) / 4.0)
        return floor((floor((base * Double(level)) / 100) + 5.0) * natureMultiplier)
    }

    var defense: Double {
        let natureMultiplier: Double

        switch nature {
        case .Bold, .Relaxed, .Impish, .Lax:
            natureMultiplier = 1.1

        case .Lonely, .Hasty, .Mild, .Gentle:
            natureMultiplier = 0.9

        default: natureMultiplier = 1
        }

        let base = 2 * Double(basePokemon.stats.defense) + Double(IVs.defense) + floor(Double(EVs.defense) / 4.0)
        return floor((floor((base * Double(level)) / 100) + 5.0) * natureMultiplier)
    }

    var specialAttack: Double {
        let natureMultiplier: Double

        switch nature {
        case .Modest, .Mild, .Quiet, .Rash:
            natureMultiplier = 1.1

        case .Adamant, .Jolly, .Impish, .Careful:
            natureMultiplier = 0.9

        default: natureMultiplier = 1
        }

        let base = 2 * Double(basePokemon.stats.specialAttack) + Double(IVs.specialAttack) + floor(Double(EVs.specialAttack) / 4.0)
        return floor((floor((base * Double(level)) / 100) + 5.0) * natureMultiplier)
    }

    var specialDefense: Double {
        let natureMultiplier: Double

        switch nature {
        case .Calm, .Careful, .Sassy, .Gentle:
            natureMultiplier = 1.1

        case .Naughty, .Naive, .Rash, .Lax:
            natureMultiplier = 0.9

        default: natureMultiplier = 1
        }

        let base = 2 * Double(basePokemon.stats.specialDefense) + Double(IVs.specialDefense) + floor(Double(EVs.specialDefense) / 4.0)
        return floor((floor((base * Double(level)) / 100) + 5.0) * natureMultiplier)
    }

    var speed: Double {
        let natureMultiplier: Double

        switch nature {
        case .Timid, .Jolly, .Hasty, .Naive:
            natureMultiplier = 1.1

        case .Quiet, .Sassy, .Brave, .Relaxed:
            natureMultiplier = 0.9

        default: natureMultiplier = 1
        }

        let base = 2 * Double(basePokemon.stats.speed) + Double(IVs.speed) + floor(Double(EVs.speed) / 4.0)
        return floor((floor((base * Double(level)) / 100) + 5.0) * natureMultiplier)
    }

    var description: String {
        return "\(basePokemon.name) @ Lv.\(level)\n---\nHP: \(hitPoints)\nAtk: \(attack)\nDef: \(defense)\nSpAtk: \(specialAttack)\nSpDef: \(specialDefense)\nSpd: \(speed)"
    }
}