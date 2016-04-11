//
//  ViewController.swift
//  PokéBattle
//
//  Created by Carlos Paelinck on 4/11/16.
//  Copyright © 2016 Carlos Paelinck. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
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
        
        preferredContentSize = NSSize(width: 640, height: 480)

        guard let window = view.window else { return }
        window.titlebarAppearsTransparent = true
        window.movableByWindowBackground = true
        window.styleMask = window.styleMask | NSFullSizeContentViewWindowMask
        window.title = ""
    }
}

