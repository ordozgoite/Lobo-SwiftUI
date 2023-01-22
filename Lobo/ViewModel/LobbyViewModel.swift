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
    
    func updatePlayers(newPlayer player: Any) {
            print("⚠️⚠️⚠️")
            print(player as Any)
            print("⚠️⚠️⚠️")
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: player, options: [])
                
                let newPlayer = try JSONDecoder().decode(Player.self, from: jsonData)
                
                self.playersInLobby.append(newPlayer)
            } catch {
                print(error)
            }
        
    }
}
