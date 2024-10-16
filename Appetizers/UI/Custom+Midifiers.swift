//
//  Custom+Midifiers.swift
//  Appetizers
//
//  Created by Michal Konkel on 16/10/2024.
//

import SwiftUI

struct StandardButtonStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
}
