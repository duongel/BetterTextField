//
//  BetterTextField.swift
//  Primes
//
//  Created by Hua Duong Nguyen on 06/06/16.
//  Copyright © 2016 fixb.it. All rights reserved.
//

import UIKit

@IBDesignable
public class BetterTextField: UITextField {

    /// The insets for the text field's text.
    public var textEdgeInsets = UIEdgeInsetsZero

    /// The insets for the text field's placeholder text.
    public var placeholderEdgeInsets = UIEdgeInsetsZero

    /// A buffer for the placeholder's text.
    private var placeholderText: String?

    /// Margin left for the text's position.
    @IBInspectable public var textMarginLeft: CGFloat {
        get {
            return textEdgeInsets.left
        }
        set {
            textEdgeInsets = UIEdgeInsetsMake(
                textEdgeInsets.top,
                newValue,
                textEdgeInsets.bottom,
                textEdgeInsets.right)
        }
    }

    /// Margin right for the text's position.
    @IBInspectable public var textMarginRight: CGFloat {
        get {
            return textEdgeInsets.right
        }
        set {
            textEdgeInsets = UIEdgeInsetsMake(
                textEdgeInsets.top,
                textEdgeInsets.left,
                textEdgeInsets.bottom,
                newValue)
        }
    }

    /// Margin left for the placeholder's position.
    @IBInspectable public var placeholderMarginLeft: CGFloat {
        get {
            return placeholderEdgeInsets.left
        }
        set {
            placeholderEdgeInsets = UIEdgeInsetsMake(
                placeholderEdgeInsets.top,
                newValue,
                placeholderEdgeInsets.bottom,
                placeholderEdgeInsets.right)
        }
    }

    /// Margin right for the placeholder's position.
    @IBInspectable public var placeholderMarginRight: CGFloat {
        get {
            return placeholderEdgeInsets.right
        }
        set {
            placeholderEdgeInsets = UIEdgeInsetsMake(
                placeholderEdgeInsets.top,
                placeholderEdgeInsets.left,
                placeholderEdgeInsets.bottom,
                newValue)
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
    override public func editingRectForBounds(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, textEdgeInsets)
    }

    // Insets for the placeholder position.
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, placeholderEdgeInsets)
    }

    /*
     * Removes the placeholder text when text field becomes first responder to avoid cursor jumping,
     * if text alignment is set to centered.
     */
    override public func becomeFirstResponder() -> Bool {
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
    override public func resignFirstResponder() -> Bool {
        let resigendFirstResponder = super.resignFirstResponder()

        if resigendFirstResponder {
            placeholder = placeholderText
        }

        return resigendFirstResponder
    }
}
