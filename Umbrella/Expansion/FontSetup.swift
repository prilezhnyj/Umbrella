//
//  FontSetup.swift
//  Umbrella
//
//  Created by Максим Боталов on 26.08.2022.
//

import UIKit

class FontSetup {
    static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Regular", size: size)!
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Bold", size: size)!
    }
}
