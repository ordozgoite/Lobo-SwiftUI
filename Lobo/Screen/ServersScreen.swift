//
//  ServersScreen.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 12/01/23.
//

import SwiftUI

struct ServersScreen: View {
    
    @EnvironmentObject var store: Store
    @State private var joinCode: String = ""
    
    @State private var isLobbyScreenPresented: Bool = false
    
    private func isValid() -> Bool {
        return !joinCode.isEmpty && joinCode.count == 5
    }
    
    var body: some View {
        VStack {
            LobbyCodeView()
        }
        .navigationTitle("Servers")
        .embedNavigationView()
        
        NavigationLink(destination: LobbyScreen(), isActive: $isLobbyScreenPresented, label: {})
    }
    
    //MARK: - Join Code
    @ViewBuilder
    private func LobbyCodeView() -> some View {
        HStack {
            TextField("Insert Lobby Code", text: $joinCode)
                .textFieldStyle(.automatic)
                .frame(width: 240, height: 64)
                
                .textInputAutocapitalization(.characters)
            
            Button("JOIN") {
                Services.shared.joinLobby(store.username!, withCode: self.joinCode.lowercased()) { lobby in
                    store.lobby = lobby
                    self.isLobbyScreenPresented = true
                }
            }
            .disabled(!isValid())
        }
        .font(Font(UIFont(name: "Avenir", size: 24)!))
    }
}

struct ServersScreen_Previews: PreviewProvider {
    static var previews: some View {
        ServersScreen()
    }
}
