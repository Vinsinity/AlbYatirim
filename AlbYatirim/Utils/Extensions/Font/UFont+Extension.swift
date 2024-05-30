//
//  UIFont+Extension.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import UIKit

enum FontFamily {
    case satoshi
    case poppins
    
    var fontName: String {
        switch self {
        case .satoshi:
            return "Satoshi"
        case .poppins:
            return "Poppins"
        }
    }
}

enum FontStyle {
    case black
    case blackItalic
    case bold
    case boldItalic
    case light
    case lightItalic
    case medium
    case mediumItalic
    case regular
    
    var styleName: String {
        switch self {
        case .black:
            return "Black"
        case .blackItalic:
            return "BlackItalic"
        case .bold:
            return "Bold"
        case .boldItalic:
            return "BoldItalic"
        case .light:
            return "Light"
        case .lightItalic:
            return "LightItalic"
        case .medium:
            return "Medium"
        case .mediumItalic:
            return "MediumItalic"
        case .regular:
            return "Regular"
        }
    }
}

extension UIFont {
    static func customFont(family: FontFamily, style: FontStyle, size: CGFloat) -> UIFont? {
        let fontName = "\(family.fontName)-\(style.styleName)"
        return UIFont(name: fontName, size: size)
    }
}
