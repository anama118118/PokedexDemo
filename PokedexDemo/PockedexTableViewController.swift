//
//  PockedexTableViewController.swift
//  PokedexDemo
//
//  Created by Ana Ma on 10/20/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class PockedexTableViewController: UITableViewController {
    
    var pokemons = [Pockemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PKAPIHelper.instance.fetchAllPokemons { (jsonDicts, response, err) in
            guard let pkJSONDicts = jsonDicts else {return}
            for jsonDict in pkJSONDicts {
                if let pokemon = Pockemon(withDict: jsonDict){
                    self.pokemons.append(pokemon)
                }
            }
            self.tableView.reloadData()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonDetail", for: indexPath) as! PokemonTableViewCell
        
        let thisPokemon = pokemons[indexPath.row]
        
        cell.pkNameLabel.text = thisPokemon.name
        let pokemonIDString = String(thisPokemon.pkdexID)
        cell.pkImageView.image = UIImage(named: pokemonIDString)
        
        let types = thisPokemon.types
        if thisPokemon.types.count > 1{
            //there's two types
            cell.pkType1.image = UIImage(named: types[0])
            cell.pkType2.image = UIImage(named: types[1])
        } else {
            cell.pkType1.image = UIImage(named: types[0])
        }
        
        cell.pkIDLabel.text = pokemonIDString
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pockedexDetailViewSegue", sender: pokemons[indexPath.row])
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "pockedexDetailViewSegue"{
            let pockedexDetailViewController: PockedexDetailViewController = segue.destination as! PockedexDetailViewController
            let selectedPockemon = sender as? Pockemon
            pockedexDetailViewController.selectedPockemon = selectedPockemon
        }
     }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


}
