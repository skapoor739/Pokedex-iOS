//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Shivam Kapur on 01/12/15.
//  Copyright © 2015 Shivam Kapur. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
 
    @IBOutlet weak var thumbImage:UIImageView!
    @IBOutlet weak var name:UILabel!
    
    var pokemon:Pokemon!
    
    func configureCell(pokemon:Pokemon) {
        self.pokemon = pokemon
        self.thumbImage.image = UIImage(named: "\(self.pokemon.pokedexID)")
        self.name.text = self.pokemon.name.capitalizedString
    }
    
}
