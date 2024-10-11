//
//  Button.swift
//  Appetizers
//
//  Created by Michal Konkel on 09/10/2024.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    
    var body: some View {
            Text(title)
                .frame(width: 280, height: 50)
                .background(.brandPrimary)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
        }
}

#Preview {
    CustomButton(title: "Test")
}
