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
import TouchVisualizer

class ViewController: UIViewController {

    @IBOutlet weak var uiTextField: UITextField!
    @IBOutlet weak var betterTextField: BetterTextField!
    var centerLine: CAShapeLayer?

    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
        centerLine = getCenterLine()

        Visualizer.start(getConfig())
    }

    func addTapGesture() {
        let tapper = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
        self.view.addGestureRecognizer(tapper)
    }

    func tapped() {
        IQKeyboardManager.shared().resignFirstResponder()
    }

    // MARK: - Illustration

    func getConfig() -> Configuration {
        var config = Configuration()
        config.defaultSize = CGSize(width: 20, height: 20)

        return config
    }

    func getCenterLine() -> CAShapeLayer {
        let screenSize: CGRect = UIScreen.main.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: screenSize.width / 2, y: 0.0))
        path.addLine(to: CGPoint(x: screenSize.width / 2, y: screenSize.height))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 1.0

        return shapeLayer
    }

    func removeCenterLine() {
        centerLine?.removeFromSuperlayer()
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            self.view.layer.addSublayer(centerLine!)
        } else {
            self.removeCenterLine()
        }
    }

    // MARK: - Text field settings

    @IBAction func clearButtonModeChanged(_ sender: UISegmentedControl) {
        textField(uiTextField, setClearButtonMode: sender.selectedSegmentIndex)
        textField(betterTextField, setClearButtonMode: sender.selectedSegmentIndex)
    }

    @IBAction func textAlignmentChanged(_ sender: UISegmentedControl) {
        textField(uiTextField, setTextAlignment: sender.selectedSegmentIndex)
        textField(betterTextField, setTextAlignment: sender.selectedSegmentIndex)
    }

    func textField(_ textField: UITextField, setClearButtonMode index: Int) {
        if let mode = UITextFieldViewMode(rawValue: index) {
            textField.clearButtonMode = mode
        }
    }

    func textField(_ textField: UITextField, setTextAlignment index: Int) {
        if let alignment = NSTextAlignment(rawValue: index) {
            textField.textAlignment = alignment
            textField.setNeedsLayout()
        }
    }

    @IBAction func marginLeftChanged(_ sender: UITextField) {
        if let value = Int(sender.text!) {
            betterTextField.marginLeft = CGFloat(value)
        } else {
            betterTextField.marginLeft = CGFloat(7)
        }

        betterTextField .setNeedsLayout()
    }

    @IBAction func marginRightChanged(_ sender: UITextField) {
        if let value = Int(sender.text!) {
            betterTextField.marginRight = CGFloat(value)
        } else {
            betterTextField.marginLeft = CGFloat(7)
        }

        betterTextField .setNeedsLayout()
    }
}
