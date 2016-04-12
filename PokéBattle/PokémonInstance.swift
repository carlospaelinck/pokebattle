//
//  PokémonInstance.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

class PokémonInstance: NSObject, NSCoding {
    var basePokémon: Pokémon
    var level: Int
    var nature: Nature
    var IVs: Stats
    var EVs: Stats
    var attacks: [Attack]

    init(basePokémon: Pokémon, level: Int, nature: Nature, IVs: Stats, EVs: Stats, attacks: [Attack]) {
        self.basePokémon = basePokémon
        self.level = level
        self.nature = nature
        self.IVs = IVs
        self.EVs = EVs
        self.attacks = attacks
    }

    required init?(coder aDecoder: NSCoder) {
        basePokémon = aDecoder.decodeObjectForKey("basePokémon") as! Pokémon
        level = aDecoder.decodeObjectForKey("level") as! Int
        IVs = aDecoder.decodeObjectForKey("IVs") as! Stats
        EVs = aDecoder.decodeObjectForKey("EVs") as! Stats
        attacks = aDecoder.decodeObjectForKey("attacks") as! [Attack]

        let natureValue = aDecoder.decodeObjectForKey("nature") as! Int
        nature = Nature(rawValue: natureValue)!

    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(basePokémon, forKey: "basePokémon")
        aCoder.encodeObject(level, forKey: "level")
        aCoder.encodeObject(IVs, forKey: "IVs")
        aCoder.encodeObject(EVs, forKey: "EVs")
        aCoder.encodeObject(attacks, forKey: "attacks")
        aCoder.encodeObject(nature.rawValue, forKey: "nature")
    }

    var hitPoints: Double {
        let base = 2 * Double(basePokémon.stats.hitPoints) + Double(IVs.hitPoints) + floor(Double(EVs.hitPoints) / 4.0)
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

        let base = 2 * Double(basePokémon.stats.attack) + Double(IVs.attack) + floor(Double(EVs.attack) / 4.0)
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

        let base = 2 * Double(basePokémon.stats.defense) + Double(IVs.defense) + floor(Double(EVs.defense) / 4.0)
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

        let base = 2 * Double(basePokémon.stats.specialAttack) + Double(IVs.specialAttack) + floor(Double(EVs.specialAttack) / 4.0)
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

        let base = 2 * Double(basePokémon.stats.specialDefense) + Double(IVs.specialDefense) + floor(Double(EVs.specialDefense) / 4.0)
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

        let base = 2 * Double(basePokémon.stats.speed) + Double(IVs.speed) + floor(Double(EVs.speed) / 4.0)
        return floor((floor((base * Double(level)) / 100) + 5.0) * natureMultiplier)
    }

    override var description: String {
        return "\(basePokémon.name) @ Lv.\(level)\n---\nHP: \(hitPoints)\nAtk: \(attack)\nDef: \(defense)\nSpAtk: \(specialAttack)\nSpDef: \(specialDefense)\nSpd: \(speed)"
    }
}