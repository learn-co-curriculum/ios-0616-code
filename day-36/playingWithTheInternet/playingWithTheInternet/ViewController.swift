//
//  ViewController.swift
//  playingWithTheInternet
//
//  Created by Joe Burgess on 7/26/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())

        print ("before creating url")
        if let githubURL = NSURL(string: "https://api.github.com/users/jmburges?client_id=7d1e5bd77778e9d64204&client_secret=b1d7e3036274eb920acdf5bb1b234b79555936d9") {

            print("before creating task")
            let githubTask = session.dataTaskWithURL(githubURL, completionHandler: { (data, response, error) in
                print("inside completion handler. Data Received")
                if let data = data {

                    do {
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary

                        print(responseData["company"])
                    } catch {
                        print("Fail!")
                    }

                }

            })
            print("Before resuming task")
            githubTask.resume()
            print("After resuming task")

        }


}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

