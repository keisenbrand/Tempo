//
//  TempoAPIClient.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 2/5/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import Foundation
import Alamofire

class TempoAPIClient {
    static let shared = TempoAPIClient() // 1
    let url = "http://127.0.0.1:5000"
    
    private init() { }
    
    func getCurrentUser(username: String, completion: @escaping (User?) -> ()) { // 2
        let path = "/currentUser/" + username
        Alamofire.request("\(url)\(path)").responseData { response in
            if let data = response.result.value { // 3
                let user = try? User(serializedData: data) // 4
                completion(user)
            }
            completion(nil)
        }
    }
    
    func addUser(username: String, userID: String, type: User.UserType, brands: [Brand], completion: @escaping (User?) -> ()) { // 2
//        var path = "/addUser/" + username + "/" + userID + "/"
//        path = path + type + "/" + brands
//        Alamofire.request("\(url)\(path)").responseData { response in
//            if let data = response.result.value { // 3
//                let user = try? User(serializedData: data) // 4
//                completion(user)
//            }
//            completion(nil)
//        }
    }
}
