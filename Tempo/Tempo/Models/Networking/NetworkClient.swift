//
//  NetworkClient.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 3/14/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import Foundation
import Alamofire

struct ProtobufEncoding: ParameterEncoding {
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try! URLEncoding().encode(urlRequest, with: nil)
        guard let parameters = parameters, let serializedRequest = parameters["serializedRequest"] else {
            return request
        }
        request.httpBody = serializedRequest as? Data
        return request
    }
}

class NetworkClient {
    
    static var shared = NetworkClient()
    
    private init() {}
    
    func fireRequest(endpoint: String, requestData: Data, completion: ((Data?, Error?) -> Void)?) {
        let headers = ["Content-Type" : "application/x-protobuf"]
        Alamofire.request(endpoint, method: .post, parameters: ["serializedRequest": requestData], encoding: ProtobufEncoding(), headers: headers)
        .validate()
        .response { (response) in
            completion?(response.data, response.error)
        }
    }
    
}
