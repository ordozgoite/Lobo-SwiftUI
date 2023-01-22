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
    @State var isCodeHidden: Bool = true
    @State private var joinCode: String = ""
    
    var body: some View {
        VStack {
            HeaderView()
            
            Text("Players:")
                .font(.largeTitle)
            
            List($lobbyVM.playersInLobby) { $player in
                Text(player.name)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
        .onAppear {
            lobbyVM.playersInLobby = store.lobby!.players
            
            lobbyVM.socket.emit("join-lobby", store.lobby!._id)
            
            lobbyVM.socket.on("join-lobby") { dataArray, ack in
                if let players = dataArray.first {
                    print("🤩 PLAYERS: \(players)")
                    lobbyVM.updatePlayers(players: players)
                }
            }
        }
    }
    
    //MARK: - Header
    @ViewBuilder
    private func HeaderView() -> some View {
        HStack {
            Spacer()
            
            Image(systemName: isCodeHidden ? "eye.slash" : "eye")
                .onTapGesture {
                    self.isCodeHidden.toggle()
                }
            
            Text(isCodeHidden ? "*****" : store.lobby!.joinCode)
        }
    }
}

struct LobbyScreen_Previews: PreviewProvider {
    static var previews: some View {
        LobbyScreen().environmentObject(Store())
    }
}
