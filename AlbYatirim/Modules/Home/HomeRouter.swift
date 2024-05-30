//
//  HomeRouter.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

protocol Router {
   func route(
      to route: HomeViewController.Route,
      parameters: Any?
   )
}

class HomeRouter: Router {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func route(to route: HomeViewController.Route, parameters: Any?) {
        switch route {
        case .detail(let symbol):
            print(symbol)
            let view = DetailBuilder.build(parameter: [symbol])
            self.viewController.navigationController?.pushViewController(view, animated: true)
        }
    }
    
}
