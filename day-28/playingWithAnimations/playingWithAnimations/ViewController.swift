//
//  ViewController.swift
//  playingWithAnimations
//
//  Created by Joe Burgess on 7/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redBox: UIView!
    var leftConstraint: NSLayoutConstraint?
    var topConstrant: NSLayoutConstraint?
    var differencePoint: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.removeConstraints(self.view.constraints)
        self.redBox.removeConstraints(self.redBox.constraints)
        self.redBox.translatesAutoresizingMaskIntoConstraints=false

        self.topConstrant =  self.redBox.topAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
        self.topConstrant?.active=true

        self.redBox.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.25).active=true
        self.redBox.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.25).active=true

        self.leftConstraint = self.redBox.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)

        self.leftConstraint?.active=true

        // [@"blah" stringByAppendingString:@"blah2"];
//        "blah".stringByAppendingString("blah2")
        let zoomRecognizer = UIPinchGestureRecognizer.init(target: self, action: #selector(newMethod))
        let dragRecognizer = UIPanGestureRecognizer.init(target:self , action: #selector(draggingRedBox))

        self.redBox.addGestureRecognizer(dragRecognizer)
        self.redBox.addGestureRecognizer(zoomRecognizer)




        print(self.redBox)

        // Do any additional setup after loading the view, typically from a nib.
    }

    func newMethod(recognizer:UIPinchGestureRecognizer) {
        print(recognizer.scale)
        print("velocity \(recognizer.velocity)")
    }

    func draggingRedBox(recognizer:UIPanGestureRecognizer) {
        let coordinates = recognizer.translationInView(self.redBox)

        if recognizer.state == .Began {
            self.differencePoint = coordinates
        } else {
            if let differencePoint = self.differencePoint {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x

                self.topConstrant?.constant += diffY
                self.leftConstraint?.constant += diffX
                self.differencePoint = coordinates

                print(self.topConstrant?.constant)
                print(coordinates)
            }
        }

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moveTapped(sender: AnyObject) {

        print("Move Tapped")

        let rightConstraint = self.redBox.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor)

        UIView.animateWithDuration(0.1, delay: 0.0, options: [.Autoreverse], animations: {
            self.leftConstraint?.active=false
            rightConstraint.active=true


            self.topConstrant?.constant=100
            self.redBox.alpha = 0.25
            self.view.layoutIfNeeded()
        }) { (completed) in
            rightConstraint.active = false
             self.leftConstraint?.active=true
            self.redBox.alpha=1.0
            self.topConstrant?.constant=0
            self.view.layoutIfNeeded()
        }
        

//        UIView.animateWithDuration(0.1) {
//            self.leftConstraint?.active=false
//            rightConstraint.active=true
//
//
//            self.topConstrant?.constant=100
//            self.redBox.alpha = 0.25
//            self.view.layoutIfNeeded()
//
//        }
    }

}

