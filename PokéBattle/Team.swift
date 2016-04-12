//
//  Team.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

class Team: NSObject, NSCoding {
    var name: String
    var pokémon: [PokémonInstance]

    override init() {
        name = ""
        pokémon = []
    }

    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        pokémon = aDecoder.decodeObjectForKey("pokémon") as! [PokémonInstance]
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(pokémon, forKey: "pokémon")
        aCoder.encodeObject(name, forKey: "name")
    }
}