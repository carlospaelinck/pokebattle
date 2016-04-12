//
//  Nature.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Foundation

enum Nature: Int {
    // No change in stats
    case Hardy = 0, Docile, Serious, Bashful, Quirky

    // Increase in Attack
    case Lonely, Brave, Adamant, Naughty

    // Increase in Defense
    case Bold, Relaxed, Impish, Lax

    // Increase in Speed
    case Timid, Hasty, Jolly, Naive

    // Increase in Special Attack
    case Modest, Mild, Quiet, Rash

    // Increase in Special Defense
    case Calm, Gentle, Sassy, Careful
}