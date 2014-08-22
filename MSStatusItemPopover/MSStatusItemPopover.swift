//
//  MSStatusItemPopover.swift
//  MSStatusItemPopover
//
//  Created by Jeff Hanbury on 22/08/2014.
//  Copyright (c) 2014 Marmaladesoul. All rights reserved.
//

import Cocoa

class MSStatusItemPopover: NSView, NSMenuDelegate {
    
    let ImageViewWidth: Int = 22
    var active: Bool = false
    var imageView: NSImageView
    var statusItem = NSStatusItem()
    var statusItemMenu = NSMenu()
    var popover = NSPopover()
    
    override init() {
        //super.init()
        
        var height: CGFloat = NSStatusBar.systemStatusBar().thickness
        
        //active = false
        
        imageView = NSImageView(frame: NSMakeRect(0, 0, CGFloat(ImageViewWidth), height))
        
//        statusItem = NSStatusItem()
//        statusItemMenu = NSMenu()
        
        super.init(frame: NSMakeRect(0, 0, CGFloat(ImageViewWidth), height))
        
        self.addSubview(imageView)
        
        statusItem.length = CGFloat(ImageViewWidth)
        statusItem.view = self
        
        statusItemMenu.autoenablesItems = false
        statusItem.menu = statusItemMenu
        statusItemMenu.delegate = self
        
        self.updateUI()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        // Drawing code here.
        if self.active {
            NSColor.selectedMenuItemColor().setFill()
            NSRectFill(dirtyRect)
        }
        else {
            NSColor.clearColor().setFill()
            NSRectFill(dirtyRect)
        }
    }

    override func mouseDown(theEvent: NSEvent) {
        self.setActive(true)
        self.statusItem.popUpStatusItemMenu(statusItemMenu)
    }
    
    override func mouseUp(theEvent: NSEvent!) {
        self.setActive(false)
    }
    
    func updateUI() {
        imageView.image = NSImage(named: active ? "cloud" : "cloudgrey")
        //[self setNeedsDisplay:YES];
    }
    
    func setActive(active: Bool) {
        self.active = active
        self.updateUI()
    }
    
    func showPopoverWithViewController(viewController: NSViewController) {
        popover.contentViewController = viewController
        
        if !popover.shown {
            popover.showRelativeToRect(self.frame, ofView: self, preferredEdge: NSMinYEdge)
        }
    }

    func hidePopover() {
        if popover.shown {
            popover.close()
        }
    }
    
    func menuDidClose(menu: NSMenu!) {
        self.setActive(false)
    }

}
