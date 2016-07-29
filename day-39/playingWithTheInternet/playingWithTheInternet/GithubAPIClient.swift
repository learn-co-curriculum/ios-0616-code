//
//  GithubAPIClient.swift
//  playingWithTheInternet
//
//  Created by Joe Burgess on 7/26/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GithubAPIClient: NSObject {
    class func getUserInfo(completionHandler: (NSDictionary)->()) {
        let authDictionary = ["client_id": "7d1e5bd77778e9d64204","client_secret":"b1d7e3036274eb920acdf5bb1b234b79555936d9"]

        Alamofire.request(.GET, "https://api.github.com/users/jmburges",parameters: authDictionary).responseJSON { (response) in

            if let JSON = response.result.value as? NSDictionary {
                completionHandler(JSON)
            }
        }

//        print("2 beginning of getUserInfo in API Client")
//        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
//
//        if let githubURL = NSURL(string: "https://api.github.com/users/jmburges?client_id=7d1e5bd77778e9d64204&client_secret=b1d7e3036274eb920acdf5bb1b234b79555936d9") {
//
//            print("3 before creating task in API CLient")
//            let githubTask = session.dataTaskWithURL(githubURL, completionHandler: {
//                (data, response, error) in
//                print("7 In completionHandler in API Client")
//                if let data = data {
//                    do {
//                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
//
//                        print("8 Converted to NSDictionary in API Client")
//                        NSOperationQueue.mainQueue().addOperationWithBlock({
//                            print("9 About to forward on completion in API Client")
//                            completionHandler(responseData)
//                            print("11 forwarded on completion in API Client")
//
//                        })
//
//                    } catch {
//                        print("Fail!")
//                    }
//
//                }
//
//            })
//            print("4 Before resuming task in API Client")
//            githubTask.resume()
//            print("5 After resuming task in API Client")
//            
//        }
    }
}
