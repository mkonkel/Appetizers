//
//  OrdersEmptState.swift
//  Appetizers
//
//  Created by Michal Konkel on 15/10/2024.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
                
            }
        }
        .offset(y: -50.0)
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "Empty Orders")
}
