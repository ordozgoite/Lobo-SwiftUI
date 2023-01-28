//
//  ServerCell.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 25/01/23.
//

import SwiftUI

struct ServerCell: View {
    
    let lobby: Lobby
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(lobby.host.name)'s Lobby")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                
                Text("\(lobby.players.count) players")
                    .foregroundColor(.gray)
            }
            .padding(4)
            
            Spacer()
        }
        .padding(8)
        .background(
            Color.ui.forestGray.opacity(0.25).shadow(color: .black, radius: 3, x: 5, y: 5).blur(radius: 1)
        )
    }
}

struct ServerCell_Previews: PreviewProvider {
    static var previews: some View {
        ServerCell(lobby: Lobby(_id: "1", host: Player(name: "Victor", id: "1"), players: [Player(name: "Victor", id: "1"), Player(name: "Vera", id: "2")], joinCode: "12345"))
    }
}
