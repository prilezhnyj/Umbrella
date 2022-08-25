//
//  UIView.swift
//  Umbrella
//
//  Created by Максим Боталов on 25.08.2022.
//

import UIKit

extension UIView {
    convenience init(bgColor: UIColor) {
        self.init()
        self.backgroundColor = bgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
