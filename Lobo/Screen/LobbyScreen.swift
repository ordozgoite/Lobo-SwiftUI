//
//  LobbyScreen.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 12/01/23.
//

import SwiftUI

struct LobbyScreen: View {
    
    @ObservedObject private var lobbyVM = LobbyViewModel()
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack {
            List($lobbyVM.playersInLobby) { $player in
                Text(player.name)
            }
        }
        .navigationTitle("Lobby")
        .embedNavigationView()
        .onAppear {
            print("Dentro da sala⚠️ \nLobbyID: \(store.lobby?._id ?? "")")
            // Connect to Socket
            SocketService.shared.connect()
            
            // Say that I'm new at the room
            lobbyVM.socket.emit("join-lobby", store.lobby?._id ?? "")
            
            // Listen to new players
            lobbyVM.socket.on("join-lobby") { dataArray, ack in
                if let player = dataArray.first {
                    print("🤩 PLAYER: \(player)")
                    lobbyVM.updatePlayers(newPlayer: player)
                }
            }
        }
    }
}

struct LobbyScreen_Previews: PreviewProvider {
    static var previews: some View {
        LobbyScreen().environmentObject(Store())
    }
}
