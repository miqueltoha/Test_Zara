//
//  CharactersListView.swift
//  Test Alten
//
//  Created by Miquel Toha Perera on 11/9/23.
//

import Foundation
import UIKit

class CharactersListView: UIView {
        
    let charactersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "CharacterTableViewCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("initCoder:) not been implemented")
    }
    
    func configureView() {
        //addSubview(searchBar)
        addSubview(charactersTableView)
        
        NSLayoutConstraint.activate([
            /*
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 80),
            */
            charactersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            charactersTableView.topAnchor.constraint(equalTo: topAnchor),
            charactersTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
