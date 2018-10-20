# BetterTextField
A drop-in replacement for UITextField.

* handles UITextField's inability to center the placeholder and text, if text alignment is set to centered and clear button is visible.
* adds margin-left and/or margin-right the easy way.

## Requirements
* Xcode 10
* Swift 4.2

## Screenshots
<img src="Example/Screenshots/demo.gif" alt="Demo" width="300px"/>

## Installation
With cocoapods:

`pod 'BetterTextField'`

Or drag `BetterTextField.swift` into your project.

## Known Issues
If text alignment is set to centered, margin-left equals margin-right by default to keep the text centered, which results in the optical glitch below.

<img src="Example/Screenshots/issue.png" alt="Margin-left Issue" width="400px"/>

# License
MIT License

Copyright (c) 2018 Hua Duong Tran

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

