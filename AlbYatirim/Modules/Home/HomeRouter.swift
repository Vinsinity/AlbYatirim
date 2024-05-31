//
//  HomeRouter.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

// - MARK: Router Protocol
protocol Router {
   func route(
      to route: HomeViewController.Route,
      parameters: Any?
   )
}

// - MARK: Home Router
class HomeRouter: Router {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    
    // MARK: Route Method
    func route(to route: HomeViewController.Route, parameters: Any?) {
        switch route {
        case .detail(let symbol):
            let view = DetailBuilder.build(parameter: [symbol])
            self.viewController.navigationController?.pushViewController(view, animated: true)
        }
    }
    
}
