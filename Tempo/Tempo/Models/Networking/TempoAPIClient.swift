//
//  TempoAPIClient.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 2/5/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import Foundation
import Alamofire

enum ServerType {
    case prod
    case dev
    case local
    
    var baseUrl: String {
        switch self {
        case .prod:
            return ""
        case .dev:
            return ""
        case .local:
            return "http://127.0.0.1:5000"
        }
    }
}

class TempoAPIClient {
    static let SERVER_TYPE: ServerType = .local
    
    static let shared = TempoAPIClient() // 1
    
    private init() { }
    
    func getCurrentUser(request: GetCurrentUserRequest, completion: ((GetCurrentUserResponse?, Error?) -> Void)?) {
        let endpoint = #function[..<#function.index(of: "(")!]

        do {
            let requestData = try request.serializedData()
            NetworkClient.shared.fireRequest(endpoint: "\(TempoAPIClient.SERVER_TYPE.baseUrl)/\(endpoint)", requestData: requestData) { (responseData, error) in
                guard let responseData = responseData else {
                    completion?(nil, error)
                    return
                }
                
                do {
                    let response = try GetCurrentUserResponse(serializedData: responseData)
                    completion?(response, error)
                } catch {
                    completion?(nil, error)
                }
            }
        } catch {
            completion?(nil, error)
        }
    }
    
    func getAllUsers(request: GetAllUsersRequest, completion: ((GetAllUsersResponse?, Error?) -> Void)?) {
        let endpoint = #function[..<#function.index(of: "(")!]
        
        do {
            let requestData = try request.serializedData()
            NetworkClient.shared.fireRequest(endpoint: "\(TempoAPIClient.SERVER_TYPE.baseUrl)/\(endpoint)", requestData: requestData) { (responseData, error) in
                guard let responseData = responseData else {
                    completion?(nil, error)
                    return
                }
                
                do {
                    let response = try GetAllUsersResponse(serializedData: responseData)
                    completion?(response, error)
                } catch {
                    completion?(nil, error)
                }
            }
        } catch {
            completion?(nil, error)
        }
    }
    
    func deleteUser(request: DeleteUserRequest, completion: ((DeleteUserResponse?, Error?) -> Void)?) {
        let endpoint = #function[..<#function.index(of: "(")!]
        
        do {
            let requestData = try request.serializedData()
            NetworkClient.shared.fireRequest(endpoint: "\(TempoAPIClient.SERVER_TYPE.baseUrl)/\(endpoint)", requestData: requestData) { (responseData, error) in
                guard let responseData = responseData else {
                    completion?(nil, error)
                    return
                }
                
                do {
                    let response = try DeleteUserResponse(serializedData: responseData)
                    completion?(response, error)
                } catch {
                    completion?(nil, error)
                }
            }
        } catch {
            completion?(nil, error)
        }
    }
    
    func addUser(request: AddUserRequest, completion: ((AddUserResponse?, Error?) -> Void)?) {
        let endpoint = #function[..<#function.index(of: "(")!]
        
        do {
            let requestData = try request.serializedData()
            NetworkClient.shared.fireRequest(endpoint: "\(TempoAPIClient.SERVER_TYPE.baseUrl)/\(endpoint)", requestData: requestData) { (responseData, error) in
                guard let responseData = responseData else {
                    completion?(nil, error)
                    return
                }
                
                do {
                    let response = try AddUserResponse(serializedData: responseData)
                    completion?(response, error)
                } catch {
                    completion?(nil, error)
                }
            }
        } catch {
            completion?(nil, error)
        }
    }
    
    func updateUser(request: UpdateUserRequest, completion: ((UpdateUserResponse?, Error?) -> Void)?) {
        let endpoint = #function[..<#function.index(of: "(")!]
        
        do {
            let requestData = try request.serializedData()
            NetworkClient.shared.fireRequest(endpoint: "\(TempoAPIClient.SERVER_TYPE.baseUrl)/\(endpoint)", requestData: requestData) { (responseData, error) in
                guard let responseData = responseData else {
                    completion?(nil, error)
                    return
                }
                
                do {
                    let response = try UpdateUserResponse(serializedData: responseData)
                    completion?(response, error)
                } catch {
                    completion?(nil, error)
                }
            }
        } catch {
            completion?(nil, error)
        }
    }
    
    func getAllBrands(request: GetAllBrandsRequest, completion: ((GetAllBrandsResponse?, Error?) -> Void)?) {
        let endpoint = #function[..<#function.index(of: "(")!]
        
        do {
            let requestData = try request.serializedData()
            NetworkClient.shared.fireRequest(endpoint: "\(TempoAPIClient.SERVER_TYPE.baseUrl)/\(endpoint)", requestData: requestData) { (responseData, error) in
                guard let responseData = responseData else {
                    completion?(nil, error)
                    return
                }
                
                do {
                    let response = try GetAllBrandsResponse(serializedData: responseData)
                    completion?(response, error)
                } catch {
                    completion?(nil, error)
                }
            }
        } catch {
            completion?(nil, error)
        }
    }
}
