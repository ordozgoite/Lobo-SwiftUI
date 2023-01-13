//
//  MainView.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 11/01/23.
//

import SwiftUI

struct MainScreen: View {
    
    @State private var isFindMatchViewPresented: Bool = false
    @State private var isServersScreenPresented: Bool = false
    @State private var isLobbyScreenPresented: Bool = false
    
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
            .opacity(isFindMatchViewPresented ? 0.25 : 1)
            .animation(.easeOut, value: isFindMatchViewPresented)
            
            ModalView()
            
            NavigationLink(destination: ServersScreen(), isActive: $isServersScreenPresented, label: {})
            NavigationLink(destination: LobbyScreen(), isActive: $isLobbyScreenPresented, label: {})
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
            
            NavigationLink(destination: LobbyScreen()) {
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
    
    //MARK: - Find Match Modal
    @ViewBuilder
    func ModalView() -> some View {
        if isFindMatchViewPresented {
            FindMatchView(isFindMatchViewPresented: $isFindMatchViewPresented, isServersScreenPresented: $isServersScreenPresented, isLobbyScreenPresented: $isLobbyScreenPresented)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
