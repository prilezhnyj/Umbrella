//
//  UITableView.swift
//  Umbrella
//
//  Created by Максим Боталов on 25.08.2022.
//

import UIKit

extension UITableView {
    
    convenience init(backgroundColor: UIColor? = .clear) {
        self.init()
        self.separatorColor = .clear
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
