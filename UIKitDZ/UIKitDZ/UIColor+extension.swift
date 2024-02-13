// UIColor+extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Расширение UIColor для инициации по RGB
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        let alphaValue = alpha
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
}
