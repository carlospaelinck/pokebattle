//
//  DataLoaderController.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

class DataLoaderController {
    var pokémon: [Pokémon] = []
    var attacks: [Attack] = []
    
    static let SharedInstance = DataLoaderController()
    
    init() {
        loadPokémonData()
        loadAttackData()
    }
    
    func loadAttackData() {
        guard let attackDataPath = NSBundle.mainBundle().pathForResource("pokémonAttacks", ofType: ".json") else { return }
        guard let attackData = NSData(contentsOfFile: attackDataPath) else { return }
        guard let attackDataObjects = try? NSJSONSerialization.JSONObjectWithData(attackData, options: NSJSONReadingOptions(rawValue: 0)) as? [[String: AnyObject]] else { return }
        
        var allAttacks: [Attack] = []
        
        attackDataObjects?.forEach {
            guard let name = $0["name"] as? String else { return }
            guard let learnset = $0["learnset"] as? [Int] else { return }
            guard let typeId = $0["type"] as? String else { return }
            guard let categoryId = $0["category"] as? Int else { return }
            guard let basePower = $0["basePower"] as? Int else { return }
            
            guard let type = PokémonType(rawValue: typeId) else { return }
            guard let category = AttackCategory(rawValue: categoryId) else { return }
            
            let attack = Attack(
                name: name,
                basePower: basePower,
                type: type,
                category: category,
                learnset: learnset
            )
            
            allAttacks.append(attack)
        }
        
        attacks = allAttacks.sort { $0.0.name < $0.1.name }
    }
    
    func loadPokémonData() {
        guard let pokémonDataPath = NSBundle.mainBundle().pathForResource("pokémonData", ofType: ".json") else { return }
        guard let pokémonData = NSData(contentsOfFile: pokémonDataPath) else { return }
        guard let pokémonObjects = try? NSJSONSerialization.JSONObjectWithData(pokémonData, options: NSJSONReadingOptions(rawValue: 0)) as? [[String: AnyObject]] else { return }
        
        var allPokémon: [Pokémon] = []
        
        pokémonObjects?.forEach {
            guard let id = $0["id"] as? Int else { return }
            guard let name = $0["name"] as? String else { return }
            guard let typeIds = $0["types"] as? [String] else { return }
            guard let statsRaw = $0["stats"] as? [Int] else { return }
            
            var types: [PokémonType] = []
            guard let primaryType = PokémonType(rawValue: typeIds.first!) else { return }
            types.append(primaryType)
            
            if let secondaryType = PokémonType(rawValue: typeIds.last!) where typeIds.count == 2 {
                types.append(secondaryType)
            }
            
            let stats = Stats(
                hitPoints: statsRaw[0],
                attack: statsRaw[1],
                defense: statsRaw[2],
                specialAttack: statsRaw[3],
                specialDefense: statsRaw[4],
                speed: statsRaw[5]
            )
            
            let pokémon = Pokémon(id: id, name: name, types: types, stats: stats)
            allPokémon.append(pokémon)
        }
        
        pokémon = allPokémon.sort { $0.0.id < $0.1.id }
    }
}