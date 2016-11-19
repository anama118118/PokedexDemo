//
//  PockedexDetailViewController.swift
//  PokedexDemo
//
//  Created by Ana Ma on 10/27/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class PockedexDetailViewController: UIViewController {

    var selectedPockemon: Pockemon?
    
    @IBOutlet weak var pockeBallImageView: UIImageView!
    @IBOutlet weak var pockemonImageView: UIImageView!
    @IBOutlet weak var pockemonNameLabel: UILabel!
    
    @IBOutlet weak var pockemonIDNumber: UILabel!
    @IBOutlet weak var pockemonGlobalIDLabel: UILabel!
    
    @IBOutlet weak var pockemonType1ImageView: UIImageView!
    @IBOutlet weak var pockemonType2ImageView: UIImageView!
    @IBOutlet weak var pockemonTypeLabel: UILabel!
    
    @IBOutlet weak var pockemonDescriptionLabel: UILabel!
    @IBOutlet weak var pockemonDescriptionUITextView: UITextView!
    
    @IBOutlet weak var speakContentButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        // Do any additional setup after loading the view.
    }

    func setupData() {
        guard let pockemon = selectedPockemon else {return}
        pockeBallImageView.image = UIImage(named: "Ball_Color")
        
        pockemonNameLabel.text = pockemon.name
        
        pockemonIDNumber.text = String(pockemon.pkdexID)
        pockemonGlobalIDLabel.text = "Global ID#"
        
        //pockemonType1ImageView.image = UIImage(named: pockemon.types[0])
        //pockemonType1ImageView.image = UIImage(named: pockemon.types[1])
        pockemonTypeLabel.text = "Type"
        
        pockemonDescriptionLabel.text = "Description"
        pockemonDescriptionUITextView.text = pockemon.description
        
        APImanager.getData(from: pockemon.imageURLString) { (data: Data?) in
            guard let data = data else {return}
            self.pockemonImageView.image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.pockemonImageView.setNeedsLayout()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
