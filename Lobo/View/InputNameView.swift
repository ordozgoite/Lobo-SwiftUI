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
                
                Spacer()
                
                TextFieldView()
                
                Spacer()
                
                ButtonView()
                
            }
            .padding(16)
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
        .padding([.top, .bottom], 8)
    }
    
    //MARK: - TextView
    @ViewBuilder
    private func TextFieldView() -> some View {
        TextField("Choose a nickname", text: $username)
            .textFieldStyle(.plain)
            .multilineTextAlignment(.center)
            .font(Font(UIFont(name: "Avenir Light", size: 32)!))
            .textInputAutocapitalization(.never)
    }
    
    //MARK: - Done Button
    @ViewBuilder
    private func ButtonView() -> some View {
        Button("Done") {
            createLobby()
        }
        .font(Font(UIFont(name: "Avenir Light", size: 32)!))
        .shadow(color: .gray, radius: 5, x: 1, y: 1)
        .disabled(username.isEmpty)
    }
}

struct InputNameView_Previews: PreviewProvider {
    static var previews: some View {
        InputNameView(username: .constant(""), isInputNameViewPresented: .constant(true), createLobby: {})
    }
}
