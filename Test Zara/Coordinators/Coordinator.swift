//
//  Coordinator.swift
//  Test Alten
//
//  Created by Miquel Toha Perera on 20/9/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var viewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    
    func start()
}

extension Coordinator {
    var viewController: UIViewController? { nil }
    var navigationController: UINavigationController? { nil }
}
