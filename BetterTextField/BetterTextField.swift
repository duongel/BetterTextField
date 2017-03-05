//
//  BetterTextField.swift
//  Primes
//
//  Created by Hua Duong Nguyen on 06/06/16.
//  Copyright © 2017 appic.me. All rights reserved.
//

import UIKit

@IBDesignable
open class BetterTextField: UITextField {

    /// A buffer for the placeholder's text.
    fileprivate var placeholderText: String?

    /// Determines if the user manually changed the text margins.
    fileprivate var defaultMode = true

    /// The text's margin left manually set by the user.
    fileprivate var textMarginLeft: CGFloat = 7.0

    /// The text's margin right manually set by the user.
    fileprivate var textMarginRight: CGFloat = 7.0

    /// The text's margin left.
    @IBInspectable open var marginLeft: CGFloat {
        get {
            if defaultMode && self.clearButtonMode != .never && self.textAlignment == .center {
                return 24.0
            } else {
                return textMarginLeft
            }
        }

        set {
            defaultMode = false
            textMarginLeft = newValue
        }
    }

    /// The text's margin right.
    @IBInspectable open var marginRight: CGFloat {
        get {
            if defaultMode && self.clearButtonMode != .never {
                return 24.0
            } else {
                return textMarginRight
            }
        }

        set {
            defaultMode = false
            textMarginRight = newValue
        }
    }
    
    /// The text field's corner radius. Default is 0.
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    /// The text field's border width. Default is 0.
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    /// The text field's border color. Default is nil.
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    // MARK: - Initialization

    override public init(frame: CGRect) {
        super.init(frame: frame)
        placeholderText = placeholder
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        placeholderText = placeholder
    }

    // MARK: - Overridden methods

    // Insets for the text position.
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, marginLeft, 0, marginRight))
    }

    // Insets for the placeholder position.
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, marginLeft, 0, marginRight))
    }

    /*
     * Removes the placeholder text when text field becomes first responder to avoid cursor jumping,
     * if text alignment is set to centered.
     */
    override open func becomeFirstResponder() -> Bool {
        let becameFirstResponder = super.becomeFirstResponder()

        if becameFirstResponder {
            placeholder = ""
        }

        return becameFirstResponder
    }

    /*
     * Restores the placeholder text to its original value, before it was removed when text field became
     * first responder.
     */
    override open func resignFirstResponder() -> Bool {
        let resigendFirstResponder = super.resignFirstResponder()

        if resigendFirstResponder {
            placeholder = placeholderText
        }

        return resigendFirstResponder
    }
}
