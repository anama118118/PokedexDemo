//
//  APIManager.swift
//  PokedexDemo
//
//  Created by Ana Ma on 10/27/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import Foundation

class APImanager{
    
    static var manager: APImanager = APImanager()
    private init (){}
    
    static func getData(from endPoint:String, completion: @escaping ((Data?) -> Void)) {
            guard let url = URL(string: endPoint) else {return}
            let session = URLSession.init(configuration: .default)
            session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                
                if error != nil {
                    print(error)
                }
                
                guard let data = data else {
                    return
                }
                completion(data)
            }).resume()
    }
    
}
