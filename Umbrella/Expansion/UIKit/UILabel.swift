//
//  UILabel.swift
//  Umbrella
//
//  Created by Максим Боталов on 26.08.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, textColor: UIColor = ColorSetup.black(), alignment: NSTextAlignment = .left, numberOfLines: Int = 0) {
        self.init()
        self.text = text
        self.numberOfLines = numberOfLines
        self.textColor = textColor
        self.textAlignment = alignment
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
