//
//  Type.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

enum PokémonType: String {
    case Bug = "Bug"
    case Dark = "Dark"
    case Dragon = "Dragon"
    case Electric = "Electric"
    case Fairy = "Fairy"
    case Fighting = "Fighting"
    case Fire = "Fire"
    case Flying = "Flying"
    case Ghost = "Ghost"
    case Grass = "Grass"
    case Ground = "Ground"
    case Ice = "Ice"
    case Normal = "Normal"
    case Poison = "Poison"
    case Psychic = "Psychic"
    case Rock = "Rock"
    case Steel = "Steel"
    case Water = "Water"
    case None = "None"
}

internal var AllPokémonTypes: [PokémonType] {
    get {
        return [
            .Bug, .Dark, .Dragon, .Electric, .Fairy, .Fighting,
            .Fire, .Flying, .Ghost, .Grass, .Ground, .Ice,
            .Normal, .Poison, .Psychic, .Rock, .Steel, .Water
        ]
    }
}