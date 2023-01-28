//
//  LBSearchBar.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 27/01/23.
//

import SwiftUI

struct LBSearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
            
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField(text: $searchText, prompt: Text("Type the lobby's name")) {
                    Text("Search lobby")
                }
                .textFieldStyle(.plain)
            }
            .padding(.leading, 16)
        }
        .frame(height: 48)
        .cornerRadius(16)
    }
}

struct LBSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        LBSearchBar(searchText: .constant(""))
    }
}
