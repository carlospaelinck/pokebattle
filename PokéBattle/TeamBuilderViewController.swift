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
    private let dataLoaderController = DataLoaderController.SharedInstance
    private var team = Team()
    private var pokémonNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokémonNames = dataLoaderController.pokémon.map { $0.name }
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
    
    @IBAction func pokémonPopUpButtonSelected(sender: NSPopUpButton) {
        let containerView = sender.superview!
        let row = tableView.rowForView(containerView)
        let selectedPokémonIdx = sender.indexOfSelectedItem
        team.pokémon[row].basePokemon = dataLoaderController.pokémon[selectedPokémonIdx]
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return team.pokémon.count
    }
    
    func tableView(tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 70.0
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let result = tableView.makeViewWithIdentifier("BuilderTableViewCell", owner: self) as? BuilderTableViewCell
        let basePokemon = team.pokémon[row].basePokemon
        
        if let pokémonPopUpButton = result?.viewWithTag(1) as? NSPopUpButton {
            pokémonPopUpButton.addItemsWithTitles(pokémonNames)
            pokémonPopUpButton.selectItemWithTitle(basePokemon.name)
        }
        
        return result
    }
}
