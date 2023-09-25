//
//  CharactersListTableViewDataSource.swift
//  Test Alten
//
//  Created by Miquel Toha Perera on 11/9/23.
//

import Foundation
import UIKit

final class CharactersListTableViewDataSource: NSObject, UITableViewDataSource {
    private let tableView: UITableView
    
    private(set) var characters: [CharacterModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, characters: [CharacterModel] = []) {
        self.tableView = tableView
        self.characters = characters
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
        cell.configure(characters[indexPath.row])
        return cell
    }
    
    func set(characters: [CharacterModel]) {
        self.characters = characters
    }
}
