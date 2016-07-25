//
//  ViewController.swift
//  playingWithDelegates
//
//  Created by Joe Burgess on 7/25/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate,CelebrationTimerDelegate {

    var displayMessage: Bool?

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.displayMessage = true

        let myTimer = CelebrationTimer()
        myTimer.startCelebration()
        myTimer.delegate = self
        
        self.searchField.delegate=self
        self.myTableView.delegate=self
        self.myTableView.dataSource=self

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)

        cell.textLabel?.text = "\(indexPath.row)"

        return cell
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("The current text is \(textField.text)")
        print(textField)
        print(range)
        print(string)

        if range.length > 1 {
            return false
        }
        return true
    }

    func didDisplayCelebration(timer: CelebrationTimer) {
        print("Notification received in VC")
    }
    func shouldDisplayCelebration(timer: CelebrationTimer) -> Bool {

        if self.displayMessage == true {
            self.displayMessage = false
            return true
        }
        self.displayMessage = true
        return false
    }


}

