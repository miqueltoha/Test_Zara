//
//  CharactersListTableViewDelegate.swift
//  Test Alten
//
//  Created by Miquel Toha Perera on 11/9/23.
//

import Foundation
import UIKit

class CharactersListTableViewDelegate: NSObject, UITableViewDelegate {
    var characterSelected: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        characterSelected?(indexPath.row)
    }
}
