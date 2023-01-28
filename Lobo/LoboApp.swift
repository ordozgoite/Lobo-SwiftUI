//
//  LoboApp.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 11/01/23.
//

import SwiftUI

@main
struct LoboApp: App {
    
    init() {
        SocketService.shared.connect()
    }
    
    let store = Store()
    
    var body: some Scene {
        WindowGroup {
            MainScreen().environmentObject(store)
        }
    }
}
