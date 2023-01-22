//
//  Services.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 21/01/23.
//

import Foundation
import Alamofire

struct Services {
    
    static let shared = Services()
    
    private init() {}
    
    func createLobby(name: String, completion: @escaping (Lobby) -> Void) {
        let hostId = UUID()
        
        let parameters: [String: Any] = [
            "hostId": hostId.uuidString,
            "hostName": name
        ]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(Constants.Urls.createLobby, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .response { response in
                switch response.result {
                case .success(let data):
                    if let body = String(data: data!, encoding: .utf8) {
                        print("Response body: \(body)")
                    }
                    
                    do {
                        let lobby = try JSONDecoder().decode(Lobby.self, from: data!)
                        print("lobby decodificado: \(lobby)")
                        completion(lobby)
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func joinLobby(_ playerName: String, withCode lobbyCode: String, completionHandler: @escaping (Lobby) -> Void) {
        
        let parameters: [String: Any] = ["name": playerName, "id": UUID().uuidString]
        
        AF.request(Constants.Urls.createLobby + "/" + lobbyCode, method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: ["Content-Type": "application/json"])
            .response { response in
                switch response.result {
                case .success(let data):
                    do {
                        let lobby = try JSONDecoder().decode(Lobby.self, from: data!)
                        print("lobby decodificado: \(lobby)")
                        completionHandler(lobby)
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
