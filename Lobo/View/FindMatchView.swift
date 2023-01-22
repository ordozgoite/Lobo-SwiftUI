//
//  FindMatchView.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 12/01/23.
//

import SwiftUI

struct FindMatchView: View {
    
    @Binding var isFindMatchViewPresented: Bool
    var automatchButtonPressed: () -> Void
    var serversButtonPressed: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.ui.offwhite)
                .cornerRadius(16)
                .opacity(0.5)
                .shadow(color: .black, radius: 10, x: 0, y: 10)
            
            VStack {
                HeaderView()
                
                ButtonsView()
                
                Spacer()
            }
        }
        .frame(width: 300, height: 250)
        
    }
    
    //MARK: - Header
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            Spacer()
            
            Button {
                isFindMatchViewPresented = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }
        }
        .padding(16)
    }
    
    //MARK: - Buttons
    @ViewBuilder
    func ButtonsView() -> some View {
        VStack(spacing: 32) {
            Button {
                automatchButtonPressed()
            } label: {
                Text("Automatch")
                    .foregroundColor(.white)
                    .font(Font(UIFont(name: "Avenir Light", size: 32)!))
            }

            Button {
                serversButtonPressed()
            } label: {
                Text("Show Servers")
                    .foregroundColor(.white)
                    .font(Font(UIFont(name: "Avenir Light", size: 32)!))
            }
        }
    }
}

struct FindMatchView_Previews: PreviewProvider {
    static var previews: some View {
        FindMatchView(isFindMatchViewPresented: .constant(true), automatchButtonPressed: {}, serversButtonPressed: {})
    }
}
