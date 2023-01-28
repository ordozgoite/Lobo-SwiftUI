//
//  ServersScreen.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 12/01/23.
//

import SwiftUI

struct ServersScreen: View {
    
    @ObservedObject private var serversVM = ServersViewModel()
    @EnvironmentObject var store: Store
    @State private var joinCode: String = ""
    @State private var isLobbyScreenPresented: Bool = false
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.ui.forestBlue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea([.bottom, .top])
            
            VStack {
                TitleView()
                
                HeaderView()
                
                ServersList()
            }
            .background(
                Image("servers_background")
                    .opacity(0.15)
                    .offset(x: 240)
            )
        }
        .embedNavigationView()
        .task {
            serversVM.getServers()
        }
//        NavigationLink(destination: LobbyScreen(), isActive: $isLobbyScreenPresented, label: {})
    }
    
    //MARK: - Title
    @ViewBuilder
    private func TitleView() -> some View {
        HStack {
            Text("Server's list")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(16)
            
            Spacer()
        }
    }
    
    //MARK: - Header
    @ViewBuilder
    private func HeaderView() -> some View {
        HStack {
            LBSearchBar(searchText: $searchText)
                .padding(8)
            
            VStack(alignment: .center, spacing: 0) {
                Text("Join Code")
                    .foregroundColor(.white)
                
                TextField("", text: $joinCode)
                    .tint(.white)
                    .frame(width: 96)
                    .multilineTextAlignment(.center)
                    .placeholder(when: joinCode.isEmpty) {
                        HStack {
                            Spacer()
                            Text("12345")
                                .foregroundColor(.white)
                                .opacity(0.5)
                            Spacer()
                        }
                    }
                    .foregroundColor(.white)
                
                
            }
            .frame(width: 80)
        }
        .frame(height: 48)
        .padding(8)
    }
    
    //MARK: - Servers
    @ViewBuilder
    private func ServersList() -> some View {
        ScrollView {
            ForEach($serversVM.serversList) { $server in
                ServerCell(lobby: server)
                    .cornerRadius(8)
                    .shadow(color: .black, radius: 2, x: 1, y: 1)
                    .padding([.leading, .trailing], 8)
                    .onTapGesture {
                        store.lobby = Lobby(_id: server._id, host: server.host, players: server.players, joinCode: server.joinCode)
                        self.isLobbyScreenPresented = true
                    }
            }
        }
    }
}

struct ServersScreen_Previews: PreviewProvider {
    static var previews: some View {
        ServersScreen()
            .environmentObject(Store())
    }
}
