//
//  Type+TypeChart.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

extension PokémonType {
    static func damageMultiplier(forAttackingType attackingType: PokémonType, andDefendingType defendingType: PokémonType) -> Double {
        switch (defendingType, attackingType) {

        /**
         * Determine the damage multiplier for the type of attack used against the type
         * of the defending Pokémon. 2 for Super-Effective, 0.5 for Not Very Effective 
         * and 0 for immune. All other neutral attacks are 1.
         */

        case (.Bug, .Fighting): return 0.5
        case (.Bug, .Fire): return 2
        case (.Bug, .Flying): return 2
        case (.Bug, .Grass): return 0.5
        case (.Bug, .Ground): return 0.5
        case (.Bug, .Rock): return 2

        case (.Dark, .Bug): return 2
        case (.Dark, .Dark): return 0.5
        case (.Dark, .Fairy): return 2
        case (.Dark, .Fighting): return 2
        case (.Dark, .Ghost): return 0.5
        case (.Dark, .Psychic): return 0

        case (.Dragon, .Dragon): return 2
        case (.Dragon, .Electric): return 0.5
        case (.Dragon, .Fairy): return 2
        case (.Dragon, .Fire): return 0.5
        case (.Dragon, .Grass): return 0.5
        case (.Dragon, .Ice): return 2
        case (.Dragon, .Water): return 0.5

        case (.Electric, .Electric): return 0.5
        case (.Electric, .Flying): return 0.5
        case (.Electric, .Ground): return 2
        case (.Electric, .Steel): return 0.5

        case (.Fairy, .Bug): return 0.5
        case (.Fairy, .Dark): return 0.5
        case (.Fairy, .Dragon): return 0
        case (.Fairy, .Fighting): return 0.5
        case (.Fairy, .Poison): return 2
        case (.Fairy, .Steel): return 2

        case (.Fighting, .Bug): return 0.5
        case (.Fighting, .Dark): return 0.5
        case (.Fighting, .Fairy): return 2
        case (.Fighting, .Flying): return 2
        case (.Fighting, .Psychic): return 2
        case (.Fighting, .Rock): return 0.5

        case (.Fire, .Bug): return 0.5
        case (.Fire, .Fairy): return 0.5
        case (.Fire, .Fire): return 0.5
        case (.Fire, .Grass): return 0.5
        case (.Fire, .Ground): return 2
        case (.Fire, .Ice): return 0.5
        case (.Fire, .Rock): return 2
        case (.Fire, .Steel): return 0.5
        case (.Fire, .Water): return 2

        case (.Flying, .Bug): return 0.5
        case (.Flying, .Electric): return 2
        case (.Flying, .Fighting): return 0.5
        case (.Flying, .Grass): return 0.5
        case (.Flying, .Ground): return 0
        case (.Flying, .Ice): return 2
        case (.Flying, .Rock): return 2

        case (.Ghost, .Bug): return 0.5
        case (.Ghost, .Dark): return 2
        case (.Ghost, .Fighting): return 0
        case (.Ghost, .Ghost): return 2
        case (.Ghost, .Normal): return 0
        case (.Ghost, .Poison): return 0.5

        case (.Grass, .Bug): return 2
        case (.Grass, .Electric): return 0.5
        case (.Grass, .Fire): return 2
        case (.Grass, .Flying): return 2
        case (.Grass, .Grass): return 0.5
        case (.Grass, .Ground): return 0.5
        case (.Grass, .Ice): return 2
        case (.Grass, .Poison): return 2
        case (.Grass, .Water): return 0.5

        case (.Ground, .Electric): return 0
        case (.Ground, .Grass): return 2
        case (.Ground, .Ice): return 2
        case (.Ground, .Poison): return 0.5
        case (.Ground, .Rock): return 0.5
        case (.Ground, .Water): return 2

        case (.Ice, .Fighting): return 2
        case (.Ice, .Fire): return 2
        case (.Ice, .Ice): return 0.5
        case (.Ice, .Rock): return 2
        case (.Ice, .Steel): return 2

        case (.Normal, .Fighting): return 2
        case (.Normal, .Ghost): return 0

        case (.Poison, .Bug): return 0.5
        case (.Poison, .Fairy): return 0.5
        case (.Poison, .Fighting): return 0.5
        case (.Poison, .Grass): return 0.5
        case (.Poison, .Ground): return 2
        case (.Poison, .Poison): return 0.5
        case (.Poison, .Psychic): return 2

        case (.Psychic, .Bug): return 2
        case (.Psychic, .Dark): return 2
        case (.Psychic, .Fighting): return 0.5
        case (.Psychic, .Ghost): return 2
        case (.Psychic, .Psychic): return 0.5

        case (.Rock, .Fighting): return 2
        case (.Rock, .Fire): return 0.5
        case (.Rock, .Flying): return 0.5
        case (.Rock, .Grass): return 2
        case (.Rock, .Ground): return 2
        case (.Rock, .Normal): return 0.5
        case (.Rock, .Poison): return 0.5
        case (.Rock, .Steel): return 2
        case (.Rock, .Water): return 2

        case (.Steel, .Bug): return 0.5
        case (.Steel, .Dragon): return 0.5
        case (.Steel, .Fairy): return 0.5
        case (.Steel, .Fire): return 2
        case (.Steel, .Flying): return 0.5
        case (.Steel, .Grass): return 0.5
        case (.Steel, .Ground): return 2
        case (.Steel, .Ice): return 0.5
        case (.Steel, .Normal): return 0.5
        case (.Steel, .Poison): return 0
        case (.Steel, .Psychic): return 0.5
        case (.Steel, .Rock): return 0.5
        case (.Steel, .Steel): return 0.5

        case (.Water, .Electric): return 2
        case (.Water, .Fire): return 0.5
        case (.Water, .Grass): return 2
        case (.Water, .Ice): return 0.5
        case (.Water, .Steel): return 0.5
        case (.Water, .Water): return 0.5

        default: return 1
        }
    }
}