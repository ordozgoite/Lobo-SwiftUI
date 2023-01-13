//
//  View+Extensions.swift
//  Lobo
//
//  Created by Victor Ordozgoite on 12/01/23.
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}
