//
//  AppDelegate.swift
//  playingWithOAuth
//
//  Created by Joe Burgess on 8/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol GithubOAuthDelegate {
    func receivedOAuthCode(code:String)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    public var oauthDelegate: GithubOAuthDelegate?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {

        let splittedURL = "\(url)".componentsSeparatedByString("my-github-app://?code=")
        let code = splittedURL[1]
        let clientID = "4e9c1b7d4cdaecbf4726"
        let clientSecret = "0071519764adabf6b8825665b41742d81dc74df9"

        let authParams = ["code": code,
                          "client_id": clientID,
                          "client_secret": clientSecret]
        let authHeaders = ["Accept":"application/json"]
        Alamofire.request(.POST, "https://github.com/login/oauth/access_token", parameters: authParams, encoding: ParameterEncoding.URLEncodedInURL, headers: authHeaders).responseJSON { (data) in
            if let value = data.result.value {
                let json = JSON(value)
                self.oauthDelegate?.receivedOAuthCode(json["access_token"].stringValue)
                }
        }



        print("Opened from \(url)")

        return true
    }


}

