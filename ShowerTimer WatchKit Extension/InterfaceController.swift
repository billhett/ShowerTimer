//
//  InterfaceController.swift
//  ShowerTimer WatchKit Extension
//
//  Created by William Hettinger on 3/23/18.
//  Copyright © 2018 William Hettinger. All rights reserved.
//

import WatchKit
import Foundation
import UIKit


class InterfaceController: WKInterfaceController {
    @IBOutlet var todaysDateLabel: WKInterfaceDate!
    @IBOutlet var myTimer: WKInterfaceTimer!
    @IBOutlet var showerDayLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let currentDate = NSDate()

        let myday = Date()
        let cal = Calendar.current
        let dayofyear = cal.ordinality(of: .day, in: .year, for: myday)
        //showerDayLabel.setText("Day of Year: \(dayofyear!)")
        if dayofyear!%2 == 0{
            
            showerDayLabel.setTextColor(UIColor.green)
            showerDayLabel.setText("A long Shower")
        } else {
            showerDayLabel.setTextColor(UIColor.red)
            showerDayLabel.setText("Not a long Shower")
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func startTapped() {
        var currentDateTime = NSDate()
        myTimer.setDate(currentDateTime as Date)
        myTimer.start()
    }
    
    @IBAction func stopTapped() {
        myTimer.stop()
    }
    
    func startTimer() {
        var currentDateTime = NSDate()
        myTimer.setDate(currentDateTime as Date)
        myTimer.start()
    }
}
