//
//  Pokémon.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

struct Pokémon {
    let id: Int
    let name: String
    let types: [PokémonType]
    let stats: Stats
}