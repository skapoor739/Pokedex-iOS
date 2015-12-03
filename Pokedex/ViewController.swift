//
//  ViewController.swift
//  Pokedex
//
//  Created by Shivam Kapur on 01/12/15.
//  Copyright © 2015 Shivam Kapur. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UISearchBarDelegate{

    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var inSearchMode:Bool = false
    
    @IBOutlet weak var searchBar:UISearchBar!
    @IBOutlet weak var collection:UICollectionView!
    var musicPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        searchBar.enablesReturnKeyAutomatically = true
        initMusic()
        ParsePokemonCSV()
    }
    
    func initMusic() {
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        do {
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        }   catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func ParsePokemonCSV() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")
        do {
        let csv = try CSV(contentsOfURL: path!)
        let rows = csv.rows
            for row in rows {
                let pokeID = Int(row["id"]!)!
                let name = row["identifier"]!
                let pokemon = Pokemon(name: name, pokedexID: pokeID)
                self.pokemon.append(pokemon)
            }
        }
            catch let err as NSError {
                print(err.debugDescription)
            }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let poke:Pokemon!
        
        if inSearchMode {
            poke = filteredPokemon[indexPath.row]
        }   else {
            poke = pokemon[indexPath.row]
        }
        
        performSegueWithIdentifier("PokemonDetailVC", sender: poke)
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonCell", forIndexPath: indexPath) as? PokemonCell {
            let poke:Pokemon!
            if inSearchMode {
                poke = filteredPokemon[indexPath.row]
            }   else {
                poke = pokemon[indexPath.row]
            }
            cell.configureCell(poke)
            return cell
            
        }  else {
            return PokemonCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredPokemon.count
        }
        return pokemon.count
    }
    
    
    @IBAction func playButtonPresed(sender:UIButton!) {
        
        if musicPlayer.playing {
            musicPlayer.stop()
            sender.alpha = 1.0
        }   else {
            musicPlayer.play()
            sender.alpha = 0.2
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PokemonDetailVC" {
            if let detailVC = segue.destinationViewController as? PokemonDetailVC {
                if let poke = sender as? Pokemon {
                    detailVC.pokemon = poke
                }
                
            }
        }
    }

    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            collection.reloadData()
            view.endEditing(true)
        }   else {
            inSearchMode = true
            let string = searchBar.text!
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(string) != nil})
            collection.reloadData()
        }
    }
}

