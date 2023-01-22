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
        .navigationTitle("Lobby \(store.lobby!._id)")
        .embedNavigationView()
        .onAppear {
            lobbyVM.socket.emit("join-lobby", store.lobby!._id)
            
            // Listen to new players
            lobbyVM.socket.on("join-lobby") { dataArray, ack in
                if let players = dataArray.first {
                    print("🤩 PLAYERS: \(players)")
                    lobbyVM.updatePlayers(players: players)
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
