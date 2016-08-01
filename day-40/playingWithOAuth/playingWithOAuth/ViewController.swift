//
//  ViewController.swift
//  playingWithOAuth
//
//  Created by Joe Burgess on 8/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit



class ViewController: UIViewController,GithubOAuthDelegate {

    func receivedOAuthCode(token: String) {
        NSUserDefaults.standardUserDefaults().setValue(token, forKey: "GithubToken")
    }
    @IBAction func buttonTapped(sender: AnyObject) {
        let oAuthToken = NSUserDefaults.standardUserDefaults().stringForKey("GithubToken")

        if oAuthToken == nil {
            let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate

            appDelegate?.oauthDelegate = self
            if let url = NSURL(string: "https://github.com/login/oauth/authorize?client_id=4e9c1b7d4cdaecbf4726") {
                UIApplication.sharedApplication().openURL(url)
            }

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

