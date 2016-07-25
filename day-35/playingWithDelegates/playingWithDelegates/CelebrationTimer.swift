//
//  CelebrationTimer.swift
//  playingWithDelegates
//
//  Created by Joe Burgess on 7/25/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit

@objc protocol CelebrationTimerDelegate {
    optional func didDisplayCelebration(timer: CelebrationTimer)
    optional func shouldDisplayCelebration(time:CelebrationTimer) -> Bool
}

class CelebrationTimer: NSObject {

    public var delegate: CelebrationTimerDelegate?

    func startCelebration() {
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(celebrate), userInfo: nil, repeats: true)
    }

    func celebrate() {
        if (self.delegate?.shouldDisplayCelebration?(self) == true) {
            print("Happy Birthday")
            self.delegate?.didDisplayCelebration?(self)
        }

    }
}
