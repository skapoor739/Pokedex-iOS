//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Shivam Kapur on 03/12/15.
//  Copyright © 2015 Shivam Kapur. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var pokeDesc: UILabel!
    @IBOutlet var typeLbl: UILabel!
    @IBOutlet var pokedexIDLbl: UILabel!
    @IBOutlet var heightLbl: UILabel!
    @IBOutlet var basePowerLbl: UILabel!
    @IBOutlet var weightLbl: UILabel!
    @IBOutlet var defenseLbl: UILabel!
    @IBOutlet var preEvolutionImg: UIImageView!
    @IBOutlet var nextEvolutionImg: UIImageView!
    @IBOutlet var nextEvolutionText: UILabel!

    var pokemon:Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name
    }
}
