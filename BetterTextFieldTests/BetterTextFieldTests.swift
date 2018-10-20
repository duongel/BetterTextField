//
//  BetterTextFieldTests.swift
//  BetterTextFieldTests
//
//  Created by Hua Duong Tran on 05/03/2017.
//  Copyright © 2017 appic.me. All rights reserved.
//

import XCTest
@testable import BetterTextField

class BetterTextFieldTests: XCTestCase {

    func testPosition() {
        let textField = BetterTextField()
        textField.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let defaultMargin: CGFloat = 7
        var editingRect = textField.editingRect(forBounds: textField.frame)
        var textRect = textField.textRect(forBounds: textField.frame)

        XCTAssertNotNil(textField)
        XCTAssertEqual(editingRect.origin.x, defaultMargin)
        XCTAssertEqual(editingRect.size.width, textField.frame.size.width - 2 * defaultMargin)
        XCTAssertEqual(textRect.origin.x, defaultMargin)
        XCTAssertEqual(textRect.size.width, textField.frame.size.width - 2 * defaultMargin)

        let marginLeft: CGFloat = 10.0
        let marginRight: CGFloat = 20.0
        textField.marginLeft = marginLeft
        textField.marginRight = marginRight

        editingRect = textField.editingRect(forBounds: textField.frame)
        textRect = textField.textRect(forBounds: textField.frame)

        XCTAssertEqual(editingRect.origin.x, marginLeft)
        XCTAssertEqual(editingRect.size.width, textField.frame.size.width - marginLeft - marginRight)
        XCTAssertEqual(textRect.origin.x, marginLeft)
        XCTAssertEqual(textRect.size.width, textField.frame.size.width - marginLeft - marginRight)
    }

    func testPlaceholderLogic() {
        let textField = BetterTextField()
        let placeholder = "very long placeholder"
        textField.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        textField.placeholder = placeholder

        // Build a view hierarchy first. Otherwise, text field will refuse to become first responder
        let window = UIWindow()
        let view = UIView()
        window.addSubview(view)
        view.addSubview(textField)

        XCTAssertEqual(textField.placeholder, placeholder)

        _ = textField.becomeFirstResponder()
        XCTAssertEqual(textField.placeholder, "")

        _ = textField.resignFirstResponder()
        XCTAssertEqual(textField.placeholder, placeholder)
    }
}
