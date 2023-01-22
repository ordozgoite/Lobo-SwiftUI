//
//  LoboApp.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 11/01/23.
//

import SwiftUI

@main
struct LoboApp: App {
    
    @State private var store = Store()
    
    var body: some Scene {
        WindowGroup {
            MainScreen().environmentObject(store)
        }
    }
}
