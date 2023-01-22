//
//  Server.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 17/01/23.
//

import Foundation

struct Lobby: Decodable {
    let _id: String
    var players: [Player]
    var joinCode: String
}
