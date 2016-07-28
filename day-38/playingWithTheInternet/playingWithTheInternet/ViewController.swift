//
//  ViewController.swift
//  playingWithTheInternet
//
//  Created by Joe Burgess on 7/26/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())

        let userURL = NSURL(string:"https://api.github.com/user")
        if let userURL = userURL {

            let githubRequest = NSMutableURLRequest(URL: userURL)
            githubRequest.addValue("token 6d26d8063a67705afebca11db2f176f3360a147e", forHTTPHeaderField: "Authorization")
            githubRequest.HTTPMethod = "PATCH"

            let updateDictionary = ["bio": "I teach at The Flatiron School"]

            do {
                githubRequest.HTTPBody = try NSJSONSerialization.dataWithJSONObject(updateDictionary, options: [])
            } catch {
                print("Error creating JSON")
            }
            
            
            let dataTask = session.dataTaskWithRequest(githubRequest, completionHandler: { (data, response, error) in
//                let httpResponse = response as! NSHTTPURLResponse
//                httpResponse.statusCode
                if let data = data {
                    do {
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: [])
                        print(responseData)
                    }   catch {
                        print("Error")
                    }
                }
            })
            dataTask.resume()
        }
        // Do any additional setup after loading the view, typically from a nib.

        print("1 before calling getUserInfo in VC")
        GithubAPIClient.getUserInfo { (responseData) in
             print("10 in completionHandler in VC")
            let location = responseData["location"] as! String
            let name = responseData["name"] as! String
            self.locationLabel.text = location
            self.nameLabel.text = name
        }
        print("6 after calling getUserInfo in VC")
        


}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

