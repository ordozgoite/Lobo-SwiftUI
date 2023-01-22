//
//  LobbyViewModel.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 21/01/23.
//

import Foundation

class LobbyViewModel: ObservableObject {
    
    var socket = SocketService.shared.getSocket()
    @Published var playersInLobby: [Player] = []
    
    func updatePlayers(players: Any) {
            print("⚠️⚠️⚠️")
            print(players as Any)
            print("⚠️⚠️⚠️")
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: players, options: [])
                
                let decodedPlayers = try JSONDecoder().decode([Player].self, from: jsonData)
                
                self.playersInLobby = decodedPlayers
            } catch {
                print(error)
            }
        
    }
}
