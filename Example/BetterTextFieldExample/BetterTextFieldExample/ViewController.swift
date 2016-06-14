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

    // MARK: - Text field settings

    @IBAction func clearButtonModeChanged(sender: UISegmentedControl) {
        textField(uiTextField, setClearButtonMode: sender.selectedSegmentIndex)
        textField(betterTextField, setClearButtonMode: sender.selectedSegmentIndex)
    }

    @IBAction func textAlignmentChanged(sender: UISegmentedControl) {
        textField(uiTextField, setTextAlignment: sender.selectedSegmentIndex)
        textField(betterTextField, setTextAlignment: sender.selectedSegmentIndex)
    }

    func textField(textField: UITextField, setClearButtonMode index: Int) {
        if let mode = UITextFieldViewMode(rawValue: index) {
            textField.clearButtonMode = mode
        }
    }

    func textField(textField: UITextField, setTextAlignment index: Int) {
        if let alignment = NSTextAlignment(rawValue: index) {
            textField.textAlignment = alignment
            textField.setNeedsLayout()
        }
    }

    @IBAction func marginLeftChanged(sender: UITextField) {
        if let value = Int(sender.text!) {
            betterTextField.marginLeft = CGFloat(value)
        } else {
            betterTextField.marginLeft = CGFloat(7)
        }

        betterTextField .setNeedsLayout()
    }

    @IBAction func marginRightChanged(sender: UITextField) {
        if let value = Int(sender.text!) {
            betterTextField.marginRight = CGFloat(value)
        } else {
            betterTextField.marginLeft = CGFloat(7)
        }

        betterTextField .setNeedsLayout()
    }
}
