//
//  TeamArchiverController.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/12/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

class TeamArchiverController {
    class func archiveTeam(team: Team, toFile fileName: String = "team.pokéBattle") -> Bool {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docDirectory = paths.first!
        let filePath = docDirectory.stringByAppendingString("/\(fileName)")
        return NSKeyedArchiver.archiveRootObject(team, toFile: filePath)
    }

    class func unarchiveTeam(fromFile fileName: String = "team.pokéBattle") -> Team? {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docDirectory = paths.first!
        let filePath = docDirectory.stringByAppendingString("/\(fileName)")
        return NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? Team
    }
}