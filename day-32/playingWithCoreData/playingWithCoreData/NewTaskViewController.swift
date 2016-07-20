//
//  NewTaskViewController.swift
//  playingWithCoreData
//
//  Created by Joe Burgess on 7/20/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {

    @IBOutlet weak var taskField: UITextField!
    let dataStore = TasksDataStore.sharedManager

    @IBAction func saveTapped(sender: AnyObject) {

        if let tasksText = self.taskField.text {
            // Task *newTask = [[Task alloc] init]
          //  dataStore.tasks.append(tasksText)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
