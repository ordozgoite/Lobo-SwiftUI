//
//  LBEndpoints.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 27/01/23.
//

import Foundation

enum LBEndpoints {
    case createLobby(username: String)
}

extension LBEndpoints: Endpoint {
    
    var path: String {
        switch self{
        case .createLobby:
            return "/api/Lobby"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .createLobby:
            return .post
        }
    }
    
    var query: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var header: [String : String]? {
        switch self {
            
        default:
            return [
                "Accept": "application/x-www-form-urlencoded",
                "Content-Type": "application/json"
            ]
        }
    }
    
    
    var body: [String : Any]? {
        
        switch self {
        case .createLobby(let username):
            let params: [String: Any] = ["hostId": UUID().uuidString,
                                         "hostName": username]
            return params
        }
    }
}

