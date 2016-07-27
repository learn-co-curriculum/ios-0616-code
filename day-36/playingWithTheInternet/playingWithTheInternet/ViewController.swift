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

