//
//  Pockemon.swift
//  PokedexDemo
//
//  Created by Ana Ma on 10/20/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import Foundation

class Pockemon {
    let name: String
    let pkdexID: Int
    let imageURLString: String
    let description: String
    let types: [String]
    
    init (name: String, pkdexID: Int, imageURLString: String, description: String, types: [String]) {
        self.name = name
        self.pkdexID = pkdexID
        self.imageURLString = imageURLString
        self.description = description
        self.types = types
    }
    
    convenience init? (withDict dictionary: [String: Any]) {
        if let name = dictionary["name"] as? String,
            let pkdexID = dictionary["pkdx_id"] as? Int,
            let imageURLString = dictionary["image_url"] as? String,
            let description = dictionary["description"] as? String,
            let types = dictionary["types"] as? [String] {
            self.init(name:name, pkdexID:pkdexID, imageURLString:imageURLString,description:description,types:types)
        }
        else {
            return nil
        }
    }
    
}
