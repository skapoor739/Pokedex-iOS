//
//  Pokemon.swift
//  Pokedex
//
//  Created by Shivam Kapur on 01/12/15.
//  Copyright © 2015 Shivam Kapur. All rights reserved.
//

import Foundation
class Pokemon {
    
    private var _name:String!
    private var _pokedexID:Int!
    private var _pokeDescription:String!
    private var _type:String!
    private var _defense:String!
    private var _height:String!
    private var _weight:String!
    private var _attack:String!
    private var _nextEvolutionText:String!
    
    var name:String {
        return _name
    }
    
    var pokedexID:Int {
        return _pokedexID
    }
    
    var pokeDescription:String {
        return _pokeDescription
    }
    
    var type:String {
        return _type
    }
    
    var defense:String {
        return _defense
    }
    
    var height:String {
        return _height
    }
    
    var weight:String {
        return _weight
    }
    
    var attack:String {
        return _attack
    }
    
    var nextEvolutionText:String {
        return _nextEvolutionText
    }
    
    init(name:String,pokedexID:Int) {
        self._name = name
        self._pokedexID = pokedexID
    }
}