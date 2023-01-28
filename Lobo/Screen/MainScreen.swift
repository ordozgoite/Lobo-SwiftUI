//
//  MainView.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 11/01/23.
//

import SwiftUI

enum Screen {
    case LobbyScreen
    case ServersScreen
}

struct MainScreen: View {
    
    @EnvironmentObject var store: Store
    @State var alertData: (Bool, String) = (false, "")
    @State var isLobbyScreenPresented: Bool = false
    @State private var isFindMatchViewPresented: Bool = false
    @State private var isServersScreenPresented: Bool = false
    @State private var isInputNameViewPresented: Bool = false
    @State private var username: String = ""
    @State private var whereDoYouGo: Screen = .LobbyScreen
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ZStack {
                BackgroundView()
                
                VStack {
                    LoboLabelView()
                        .padding(.top, 64)
                    
                    Spacer()
                    
                    PlayButtonsView()
                }
            }
            .opacity(isFindMatchViewPresented || isInputNameViewPresented ? 0.25 : 1)
            .animation(.easeOut, value: isFindMatchViewPresented)
            .animation(.easeOut, value: isInputNameViewPresented)
            
            ModalView()
            
            // NEXT SCREENS
            NavigationLink(destination: LobbyScreen(), isActive: $isLobbyScreenPresented, label: {})
            NavigationLink(destination: ServersScreen(), isActive: $isServersScreenPresented, label: {})
        }
        .embedNavigationView()
    }
    
    //MARK: - Background
    @ViewBuilder
    func BackgroundView() -> some View {
        LinearGradient(colors: [Color.ui.forestGray, Color.ui.forestRed], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        
        Image("background")
            .resizable()
            .ignoresSafeArea()
            .opacity(0.25)
    }
    
    //MARK: - LOBO
    @ViewBuilder
    func LoboLabelView() -> some View {
        Text("LOBO")
            .font(Font(UIFont(name: "Ghastly Panic", size: 160)!))
            .overlay {
                LinearGradient(colors: [Color.ui.lightRed, Color.ui.darkRed], startPoint: .top, endPoint: .bottom)
            }
            .mask {
                Text("LOBO")
                    .font(Font(UIFont(name: "Ghastly Panic", size: 160)!))
            }
            .shadow(color: .black, radius: 0, x: 0, y: 4)
    }
    
    //MARK: - Play Buttons
    @ViewBuilder
    func PlayButtonsView() -> some View {
        VStack(spacing: 48) {
            ZStack {
                Rectangle()
                    .fill(.black)
                    .frame(width: 280, height: 64)
                    .cornerRadius(16)
                    .opacity(0.5)
                    .shadow(color: .black, radius: 3, x: 5, y: 5)
                
                Text("Find Match")
                    .font(Font(UIFont(name: "Avenir Roman", size: 24)!))
                    .foregroundColor(.white)
            }
            .onTapGesture {
                self.isFindMatchViewPresented = true
            }
            
            Button {
                self.whereDoYouGo = .LobbyScreen
                isInputNameViewPresented = true
            } label: {
                ZStack {
                    Rectangle()
                        .fill(.black)
                        .frame(width: 280, height: 64)
                        .cornerRadius(16)
                        .opacity(0.5)
                        .shadow(color: .black, radius: 3, x: 5, y: 5)
                    
                    Text("Create Lobby")
                        .font(Font(UIFont(name: "Avenir Roman", size: 24)!))
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.bottom, 16)
    }
    
    //MARK: - Modal
    @ViewBuilder
    func ModalView() -> some View {
        if isFindMatchViewPresented {
            FindMatchView(isFindMatchViewPresented: $isFindMatchViewPresented) {
                // MATCH MAKING
            } serversButtonPressed: {
                whereDoYouGo = .ServersScreen
                self.isFindMatchViewPresented = false
                self.isInputNameViewPresented = true
            }
            
        } else if isInputNameViewPresented {
            InputNameView(username: $username, isInputNameViewPresented: $isInputNameViewPresented) {
                store.username = self.username
                switch whereDoYouGo {
                case .LobbyScreen:
                    Task {
                        let result = await Services.shared.createLobby(username: self.username)
                        
                        switch result {
                        case .success(let lobby):
                            store.lobby = lobby
                            isLobbyScreenPresented = true
                        case .failure:
                            alertData = (true, "Failure")
                        }
                    }
                case .ServersScreen:
                    self.isServersScreenPresented = true
                }
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen().environmentObject(Store())
    }
}
