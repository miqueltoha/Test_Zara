//
//  CharacterDetailView.swift
//  Test Alten
//
//  Created by Miquel Toha Perera on 12/9/23.
//

import Foundation
import UIKit

class CharacterDetailView: UIView {
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let characterName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let characterStatus: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let characterSpecie: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    func configureView() {
        
        backgroundColor = .white
        
        addSubview(characterImageView)
        addSubview(characterName)
        addSubview(characterStatus)
        addSubview(characterSpecie)
        
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 200),
            characterImageView.widthAnchor.constraint(equalToConstant: 200),
            
            characterName.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            characterName.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            
            characterStatus.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 8),
            
            characterSpecie.leadingAnchor.constraint(equalTo: characterStatus.leadingAnchor),
            characterSpecie.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 8),
        ])
    }
    
    func configure(_ model: CharacterModel) {
        self.characterName.text = model.name
        self.characterStatus.text = model.status
        self.characterSpecie.text = model.species
        if let url = URL(string: model.image) {
            self.characterImageView.downloadImage(with: url)
        }
    }
    
}
