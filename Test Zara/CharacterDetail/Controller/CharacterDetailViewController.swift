//
//  CharacterDetailViewController.swift
//  Test Alten
//
//  Created by Miquel Toha Perera on 12/9/23.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    var mainView: CharacterDetailView { self.view as! CharacterDetailView }
    
    init(characterDetailModel: CharacterModel) {
        super.init(nibName: nil, bundle: nil)
        mainView.configure(characterDetailModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = CharacterDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
}
