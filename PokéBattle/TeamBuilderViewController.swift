//
//  TeamBuilderViewController.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Cocoa

class TeamBuilderViewController: NSViewController,
    NSTableViewDelegate, NSTableViewDataSource,
    NSTextFieldDelegate {

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
        tableView.reloadData()
    }

    override func controlTextDidChange(obj: NSNotification) {
        guard let textField = obj.object as? NSTextField else { return }
        let row = tableView.rowForView(textField.superview!)

        guard let EV = Int(textField.stringValue) where 0..<255 ~= EV else { return }

        switch textField.tag {
        case 10: team.pokémon[row].EVs.hitPoints = EV
        case 11: team.pokémon[row].EVs.attack = EV
        case 12: team.pokémon[row].EVs.defense = EV
        case 13: team.pokémon[row].EVs.specialAttack = EV
        case 14: team.pokémon[row].EVs.specialDefense = EV
        case 15: team.pokémon[row].EVs.speed = EV
        default: break
        }
    }

    override func controlTextDidEndEditing(obj: NSNotification) {
        tableView.reloadData()
    }

    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return team.pokémon.count
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let result = tableView.makeViewWithIdentifier("BuilderTableViewCell", owner: self) as? BuilderTableViewCell
        let pokémonInstance = team.pokémon[row]
        let basePokémon = pokémonInstance.basePokemon
        
        guard let pokémonPopUpButton = result?.viewWithTag(1) as? NSPopUpButton else { return nil }
        pokémonPopUpButton.addItemsWithTitles(pokémonNames)
        pokémonPopUpButton.selectItemWithTitle(basePokémon.name)

        guard let typeLabel = result?.viewWithTag(2) as? NSTextField else { return nil }
        let typeStrings = basePokémon.types.map { $0.rawValue }
        typeLabel.stringValue = typeStrings.joinWithSeparator(" / ")

        guard let hpEVTextField = result?.viewWithTag(10) as? NSTextField else { return nil }
        hpEVTextField.stringValue = String(pokémonInstance.EVs.hitPoints)

        guard let atkEVTextField = result?.viewWithTag(11) as? NSTextField else { return nil }
        atkEVTextField.stringValue = String(pokémonInstance.EVs.attack)

        guard let defEVTextField = result?.viewWithTag(12) as? NSTextField else { return nil }
        defEVTextField.stringValue = String(pokémonInstance.EVs.defense)

        guard let spAEVTextField = result?.viewWithTag(13) as? NSTextField else { return nil }
        spAEVTextField.stringValue = String(pokémonInstance.EVs.specialAttack)

        guard let spDEVTextField = result?.viewWithTag(14) as? NSTextField else { return nil }
        spDEVTextField.stringValue = String(pokémonInstance.EVs.specialDefense)

        guard let speEVTextField = result?.viewWithTag(15) as? NSTextField else { return nil }
        speEVTextField.stringValue = String(pokémonInstance.EVs.speed)
        
        return result
    }
}
