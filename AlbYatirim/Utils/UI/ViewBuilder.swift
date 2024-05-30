//
//  ViewBuilder.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import UIKit

protocol ViewBuilder: AnyObject {
    static func build() -> UIViewController
}
