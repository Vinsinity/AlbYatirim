//
//  ViewBuilder.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import UIKit

protocol ViewBuilder: AnyObject {
    static func build(parameter: [String]) -> UIViewController
}

extension ViewBuilder {
    static func build(parameter: [String] = []) -> UIViewController {
        return build(parameter: parameter)
    }
}
