//
//  ViewController.swift
//  BetterTextFieldExample
//
//  Created by Hua Duong Nguyen on 11/06/16.
//  Copyright © 2016 fixbit. All rights reserved.
//

import UIKit
import BetterTextField
import IQKeyboardManager

class ViewController: UIViewController {

    @IBOutlet weak var uiTextField: UITextField!
    @IBOutlet weak var betterTextField: BetterTextField!
    var centerLine: CAShapeLayer?

    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
        centerLine = getCenterLine()
    }

    func addTapGesture() {
        let tapper = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
        self.view.addGestureRecognizer(tapper)
    }

    func tapped() {
        IQKeyboardManager.sharedManager().resignFirstResponder()
    }

    // MARK: - Illustration

    func getCenterLine() -> CAShapeLayer {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(screenSize.width / 2, 0.0))
        path.addLineToPoint(CGPointMake(screenSize.width / 2, screenSize.height))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        shapeLayer.lineWidth = 1.0

        return shapeLayer
    }

    func removeCenterLine() {
        centerLine?.removeFromSuperlayer()
    }

    @IBAction func switchChanged(sender: UISwitch) {
        if sender.on {
            self.view.layer.addSublayer(centerLine!)
        } else {
            self.removeCenterLine()
        }
    }
}
