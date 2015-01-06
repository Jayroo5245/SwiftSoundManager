//
//  SoundTableViewController.swift
//  SwiftSoundManager
//
//  Created by Adam Bailey on 1/6/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

import UIKit
import AudioToolbox

class SoundTableViewController: UITableViewController {
    
    var sound: Sounds = Sounds()
    
    var lastSelected: NSIndexPath! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.sound.sounds.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:UITableViewCell! = self.tableView.dequeueReusableCellWithIdentifier("soundCell", forIndexPath: indexPath) as UITableViewCell
            
        cell.textLabel!.text = self.sound.sounds[indexPath.row].name
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let audioID: SystemSoundID = self.sound.sounds[indexPath.row].audioID
        sound.playSystemSound(audioID)
        
        if (lastSelected != nil) {
            // deselect old
            var old: UITableViewCell! = self.tableView.cellForRowAtIndexPath(self.lastSelected)
            old.accessoryType = .None
        }
    
        // select new
        var cell: UITableViewCell! = self.tableView.cellForRowAtIndexPath(indexPath)
        cell.accessoryType = .Checkmark
        
        // keep track of the last selected cell
        self.lastSelected = indexPath;
    }
}
