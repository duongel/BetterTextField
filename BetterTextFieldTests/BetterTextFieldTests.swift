//
//  BetterTextFieldTests.swift
//  BetterTextFieldTests
//
//  Created by Hua Duong Nguyen on 05/03/2017.
//  Copyright © 2017 appic.me. All rights reserved.
//

import XCTest
@testable import BetterTextField

class BetterTextFieldTests: XCTestCase {

    func testMargins() {
        let textField = BetterTextField()
        let marginLeft: CGFloat = 10.0
        let marginRight: CGFloat = 20.0
        textField.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        textField.marginLeft = marginLeft
        textField.marginRight = marginRight

        let editingRect = textField.editingRect(forBounds: textField.frame)

        XCTAssertNotNil(textField)
        XCTAssertEqual(editingRect.origin.x, marginLeft)
        XCTAssertEqual(editingRect.size.width, textField.frame.size.width - marginLeft - marginRight)
    }

    func testPlaceholder() {
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
