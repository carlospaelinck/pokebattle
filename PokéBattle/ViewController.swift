//
//  ViewController.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewWillAppear() {
        super.viewWillAppear()

        guard let window = view.window else { return }
        window.titlebarAppearsTransparent = true
        window.movableByWindowBackground = true
        window.styleMask = window.styleMask | NSFullSizeContentViewWindowMask
        window.title = "PokéBattle"

        let blastoise = PokémonInstance(
            basePokemon: Pokémon.Blastoise(),
            level: 36,
            nature: .Modest,
            IVs: Stats(
                hitPoints: 31,
                attack: 0,
                defense: 31,
                specialAttack: 31,
                specialDefense: 31,
                speed: 31
            ),
            EVs: Stats(
                hitPoints: 6,
                attack: 0,
                defense: 0,
                specialAttack: 252,
                specialDefense: 0,
                speed: 252
            )
        )

        let chandelure = PokémonInstance(
            basePokemon: Pokémon.Chandelure(),
            level: 36,
            nature: .Timid,
            IVs: Stats(
                hitPoints: 31,
                attack: 0,
                defense: 31,
                specialAttack: 31,
                specialDefense: 31,
                speed: 31
            ),
            EVs: Stats(
                hitPoints: 6,
                attack: 0,
                defense: 0,
                specialAttack: 252,
                specialDefense: 0,
                speed: 252
            )
        )

        print(blastoise, chandelure, separator: "\n", terminator: "\n")

        let battle = BattleController()
        let attack = Attack.Scald()
    }
}

