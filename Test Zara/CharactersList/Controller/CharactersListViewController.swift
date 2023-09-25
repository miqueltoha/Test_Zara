//
//  CharactersListViewController.swift
//  Test Alten
//
//  Created by Miquel Toha Perera on 11/9/23.
//

import UIKit

class CharactersListViewController: UIViewController {
    var mainView: CharactersListView { self.view as! CharactersListView }
    var characterModelResult: [CharacterModel] = []
    let apiCall = CharactersList()
    let searchController = UISearchController(searchResultsController: nil)
    
    private var tableViewDataSource: CharactersListTableViewDataSource?
    private var tableViewDelegate: CharactersListTableViewDelegate?
    
    var characterDetailPushCoordinator: CharacterDetailPushCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Characters"
        
        configureSearchBar()
        tableViewDelegate?.characterSelected = {
            [weak self] index in
            guard let dataSource = self?.tableViewDataSource else { return }
            
            let characterModel = dataSource.characters[index]
            self?.characterDetailPushCoordinator = CharacterDetailPushCoordinator(navigationController: self?.navigationController, characterModel: characterModel)
            self?.characterDetailPushCoordinator?.start()
        }
        
        Task {
            let characters = await apiCall.getCharactersList()
            characterModelResult = characters.results
            tableViewDataSource?.set(characters: characterModelResult)
        }
    }
    
    override func loadView() {
        view = CharactersListView()
        tableViewDelegate = CharactersListTableViewDelegate()
        tableViewDataSource = CharactersListTableViewDataSource(tableView: mainView.charactersTableView)
        mainView.charactersTableView.delegate = tableViewDelegate
        mainView.charactersTableView.dataSource = tableViewDataSource
    }
    
    func configureSearchBar() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
}

extension CharactersListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        var filteredResults: [CharacterModel] = []
        characterModelResult.forEach{ char in
            if char.name.lowercased().contains(text.lowercased()) {
                    filteredResults.append(char)
            }
        }
        tableViewDataSource?.set(characters: text.isEmpty ? characterModelResult : filteredResults)
    }
}
