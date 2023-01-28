//
//  ServersViewModel.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 17/01/23.
//

import Foundation

@MainActor
class ServersViewModel: ObservableObject {
    
    @Published var serversList: [Lobby] = []
    
    func getServers() {
        serversList = [
            Lobby(_id: "1", host: Player(name: "Victor", id: "1"), players: [Player(name: "Victor", id: "1"), Player(name: "Vera", id: "2")], joinCode: "12345"),
            Lobby(_id: "2", host: Player(name: "Fernando", id: "1"), players: [Player(name: "Victor", id: "1"), Player(name: "Vera", id: "2")], joinCode: "12345"),
            Lobby(_id: "3", host: Player(name: "Cacoo", id: "1"), players: [Player(name: "Victor", id: "1"), Player(name: "Vera", id: "2")], joinCode: "12345"),
            Lobby(_id: "4", host: Player(name: "3runinho", id: "1"), players: [Player(name: "Victor", id: "1"), Player(name: "Vera", id: "2")], joinCode: "12345"),
            Lobby(_id: "5", host: Player(name: "joazinho123", id: "1"), players: [Player(name: "Victor", id: "1"), Player(name: "Vera", id: "2")], joinCode: "12345"),
            Lobby(_id: "6", host: Player(name: "Mashka", id: "1"), players: [Player(name: "Victor", id: "1"), Player(name: "Vera", id: "2")], joinCode: "12345")
        ]
        
        print("👌 List loaded")
    }
}

