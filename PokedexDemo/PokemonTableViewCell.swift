//
//  PokemonTableViewCell.swift
//  PokedexDemo
//
//  Created by Ana Ma on 10/20/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pkIDLabel: UILabel!
    @IBOutlet weak var pkImageView: UIImageView!
    @IBOutlet weak var pkNameLabel: UILabel!
    @IBOutlet weak var pkType1: UIImageView!
    @IBOutlet weak var pkType2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        pkType1.image = nil
        pkType2.image = nil
    }

}
