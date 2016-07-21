//
//  ListsTableViewController.swift
//  playingWithCoreData
//
//  Created by Joe Burgess on 7/21/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit
import CoreData

class ListsTableViewController: UITableViewController {

    let dataStore = TasksDataStore.sharedManager
    var lists: [List]?

    override func viewDidLoad() {
        super.viewDidLoad()

        let listEntity = NSEntityDescription.entityForName("List", inManagedObjectContext: self.dataStore.managedObjectContext)
        let taskEntity = NSEntityDescription.entityForName("Task", inManagedObjectContext: self.dataStore.managedObjectContext)

        if let listEntity = listEntity,let taskEntity=taskEntity {
            let newList = List(entity: listEntity, insertIntoManagedObjectContext: self.dataStore.managedObjectContext)
            newList.name = "Home \(NSDate())"

            let newTask = Task(entity: taskEntity, insertIntoManagedObjectContext: self.dataStore.managedObjectContext)
            newTask.content = "Do LAundry \(NSDate())"

//            newTask.list=newList

            newList.tasks.insert(newTask)


            self.dataStore.saveContext()
        }

        let listsFetchRequest = NSFetchRequest(entityName: "List")

        do {
            self.lists = try self.dataStore.managedObjectContext.executeFetchRequest(listsFetchRequest) as? [List]
        }catch let coreDataError as NSError {
            print("########################")
            print(coreDataError)
            print("########################")
        }


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let lists = self.lists {
            return lists.count
        }
        return 0

    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)

        if let lists = self.lists {
            cell.textLabel?.text = lists[indexPath.row].name
        }
        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        if let lists=self.lists {
//            let selectedList = lists[indexPath.row]
//            print(selectedList.tasks)
//        }
//
//    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        let destinationVC = segue.destinationViewController as? TasksTableViewController
        if let lists = self.lists {
            let selectedList = lists[self.tableView.indexPathForSelectedRow!.row]
            destinationVC?.list = selectedList
        }
    }


}
