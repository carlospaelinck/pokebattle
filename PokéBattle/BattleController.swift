//
//  BattleController.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

class BattleController {
    func performAttack(
        attack atk: Attack,
        attackingPokemonInstance atkPkm: PokémonInstance,
        defendingPokemonInstance defPkm: PokémonInstance) {

        let level = atkPkm.level
        let attackStat = atkPkm.specialAttack
        let defenseStat = defPkm.specialDefense
        let baseDamage = Double(atk.basePower)
        let STAB = atkPkm.basePokemon.types.contains(atk.type) ? 1.5 : 1.0
        let attackType: PokémonType = atk.type
        let roll = (Double(arc4random_uniform(16) + 85) / 100)

        let damageMultiplierA = PokémonType.damageMultiplier(forAttackingType: attackType, andDefendingType: defPkm.basePokemon.types.first!)
        var damageMultiplierB: Double = 1

        if let secondaryType = defPkm.basePokemon.types.last where defPkm.basePokemon.types.count == 2 {
            damageMultiplierB = PokémonType.damageMultiplier(forAttackingType: attackType, andDefendingType: secondaryType)
        }

        let modifier = STAB * damageMultiplierA * damageMultiplierB * 1 * 1 * roll
        let damage = ((2.0 * Double(level) + 10) / 250.0 * (attackStat / defenseStat) * Double(baseDamage) + 2.0)
        let _ = floor(floor(damage) * modifier)
    }
}