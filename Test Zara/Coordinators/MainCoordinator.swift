//
//  MainCoordinator.swift
//  Test Alten
//
//  Created by Miquel Toha Perera on 20/9/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let charactersListViewController = storyBoard.instantiateViewController(identifier: "CharactersListViewController")
        navigationController?.pushViewController(charactersListViewController, animated: true)
    }
}
