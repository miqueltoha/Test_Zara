//
//  CharacterDetailPushCoordinator.swift
//  Test Alten
//
//  Created by Miquel Toha Perera on 20/9/23.
//

import Foundation
import UIKit

class CharacterDetailPushCoordinator: Coordinator {
    var characterModel: CharacterModel
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?, characterModel: CharacterModel) {
        self.navigationController = navigationController
        self.characterModel = characterModel
    }
    
    func start() {
        let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
        navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
    
    
}

