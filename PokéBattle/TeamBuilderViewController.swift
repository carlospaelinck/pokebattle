//
//  TeamBuilderViewController.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Cocoa

class TeamBuilderViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    @IBOutlet weak private var tableView: NSTableView!
    private let dataLoaderController = DataLoaderController()
    private var team = Team()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func addPokémonToTeam(sender: NSButton) {
        guard let firstPokémon = dataLoaderController.pokémon.first else { return }
        
        let pokémonInstance = PokémonInstance(
            basePokemon: firstPokémon,
            level: 50,
            nature: .Serious,
            IVs: StatsZero,
            EVs: StatsZero,
            attacks: []
        )
        
        team.pokémon.append(pokémonInstance)
        tableView.reloadData()
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return team.pokémon.count
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        
//        let result = tableView.makeViewWithIdentifier(<#T##identifier: String##String#>, owner: <#T##AnyObject?#>)
        return nil
    }
}
