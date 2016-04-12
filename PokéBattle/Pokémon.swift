//
//  Pokémon.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

class Pokémon: NSObject, NSCoding {
    let id: Int
    let name: String
    let types: [PokémonType]
    let stats: Stats

    init(id: Int, name: String, types: [PokémonType], stats: Stats) {
        self.id = id
        self.name = name
        self.types = types
        self.stats = stats
    }

    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as! Int
        name = aDecoder.decodeObjectForKey("name") as! String
        stats = aDecoder.decodeObjectForKey("stats") as! Stats

        let typeValues = aDecoder.decodeObjectForKey("types") as! [String]
        types = typeValues.map { PokémonType(rawValue: $0)! }

    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(stats, forKey: "stats")

        let typeValues = types.map { $0.rawValue }
        aCoder.encodeObject(typeValues, forKey: "types")
    }
}