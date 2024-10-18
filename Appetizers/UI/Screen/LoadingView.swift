//
//  LoadingView.swift
//  Appetizers
//
//  Created by Michal Konkel on 08/10/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
