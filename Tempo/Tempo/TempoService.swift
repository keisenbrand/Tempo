//
//  TempoService.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 2/5/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import Foundation
import Alamofire

class TempoService {
    static let shared = TempoService() // 1
    let url = "http://127.0.0.1:5000"
    
    private init() { }
    
    func getCurrentUser(_ completion: @escaping (User?) -> ()) { // 2
        let path = "/currentUser"
        Alamofire.request("\(url)\(path)").responseData { response in
            if let data = response.result.value { // 3
                let contact = try? User(serializedData: data) // 4
                completion(contact)
            }
            completion(nil)
        }
    }
}
