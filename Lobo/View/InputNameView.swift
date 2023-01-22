//
//  InputNameView.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 21/01/23.
//

import SwiftUI

struct InputNameView: View {
    
    @Binding var username: String
    @Binding var isInputNameViewPresented: Bool
    var createLobby: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.ui.offwhite)
                .cornerRadius(16)
                .opacity(0.5)
                .shadow(color: .black, radius: 10, x: 0, y: 10)
            
            VStack {
                HeaderView()
                
                TextField("Choose a username", text: $username)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.center)
                    .font(Font(UIFont(name: "Avenir Light", size: 32)!))
                    .textInputAutocapitalization(.never)
                
                Button("Done") {
                    createLobby()
                }
                .font(Font(UIFont(name: "Avenir Light", size: 32)!))
                .shadow(color: .red, radius: 5, x: 1, y: 1)
                .disabled(username.isEmpty)
            }
            .foregroundColor(.white)
        }
        .frame(width: 300, height: 250)
    }
    
    //MARK: - Header
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            Spacer()
            
            Button {
                isInputNameViewPresented = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }
        }
        .padding(16)
    }
}

struct InputNameView_Previews: PreviewProvider {
    static var previews: some View {
        InputNameView(username: .constant(""), isInputNameViewPresented: .constant(true), createLobby: {})
    }
}
