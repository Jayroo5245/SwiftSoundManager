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
    
    var soundManager: SoundManager = SoundManager()
    
    var lastSelected: NSIndexPath! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor().mainBackgroundColor()
        view.tintColor = UIColor().primaryTintColor()
        tableView.backgroundColor = UIColor().mainBackgroundColor()
        tableView.separatorColor = UIColor().secondaryBorderColor()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let row = soundManager.rowForSoundName(SwiftSoundManagerDefaults.sharedInstance.alertChosen)
        if (row >= 0) {
            lastSelected = NSIndexPath(forRow: row, inSection: 0)
        }
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
        return self.soundManager.sounds.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("soundCell", forIndexPath: indexPath) as UITableViewCell
            
        cell.textLabel!.text = soundManager.sounds[indexPath.row].displayName
        cell.backgroundColor = UIColor().tableCellBackgroundColor()
        cell.textLabel!.textColor = UIColor().primaryTextColor()
        
        if (lastSelected != nil && lastSelected! == indexPath) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }

    // MARK: - Table view data delegate

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let audioID: SystemSoundID = self.soundManager.sounds[indexPath.row].audioID
        soundManager.playSystemSound(audioID)
        
        // keep track of the last selected cell
        lastSelected = indexPath

        tableView.reloadData()
        
        SwiftSoundManagerDefaults.sharedInstance.alertChosen = soundManager.sounds[indexPath.row].soundName
    }
}
