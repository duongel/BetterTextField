//
//  ViewController.swift
//  BetterTextFieldExample
//
//  Created by Hua Duong Nguyen on 11/06/16.
//  Copyright © 2016 fixbit. All rights reserved.
//

import UIKit
import BetterTextField

class ViewController: UIViewController {

    var centerLine: CAShapeLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Illustration

    func drawCenterLine() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(screenSize.width / 2, 0.0))
        path.addLineToPoint(CGPointMake(screenSize.width / 2, screenSize.height))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        shapeLayer.lineWidth = 1.0

        self.view.layer.addSublayer(shapeLayer)
        centerLine = shapeLayer
    }

    func removeCenterLine() {
        centerLine?.removeFromSuperlayer()
    }

    @IBAction func switchChanged(sender: UISwitch) {
        print(sender.on)
        if sender.on {
            self.drawCenterLine()
        } else {
            self.removeCenterLine()
        }
    }
}
