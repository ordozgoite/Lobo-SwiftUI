//
//  Server.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 17/01/23.
//

import Foundation

struct Lobby: Decodable, Identifiable {
    
    var id = UUID()
    let _id: String
    let host: Player
    var players: [Player]
    var joinCode: String
    
    enum CodingKeys: CodingKey {
        case _id
        case host
        case players
        case joinCode
    }
}
