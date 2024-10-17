//
//  AppetizerListItem.swift
//  Appetizers
//
//  Created by Michal Konkel on 02/10/2024.
//

import Foundation
import SwiftUI

struct AppetizerListItem: View {
    var item: Appetizer
    
    var body: some View {
        HStack {
            AppetizerListImage(item: item)
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    
                Text("$\(item.price, specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListItem(item: MockData.appetizers.first!)
}
