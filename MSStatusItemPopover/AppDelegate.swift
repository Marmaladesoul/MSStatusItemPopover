//
//  AppDelegate.swift
//  MSStatusItemPopover
//
//  Created by Jeff Hanbury on 22/08/2014.
//  Copyright (c) 2014 Marmaladesoul. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!
    
    var statusView = MSStatusItemPopover()


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }

    @IBAction func showPopover(sender: AnyObject) {
        let popoverView = PopoverContentViewController(nibName: "PopoverContentViewController", bundle: nil)
        statusView.showPopoverWithViewController(popoverView)
    }
    
    @IBAction func hidePopover(sender: AnyObject) {
        statusView.hidePopover()
    }

}

