//
//  AppetizerImage.swift
//  Appetizers
//
//  Created by Michal Konkel on 16/10/2024.
//

import SwiftUI

struct AppetizerDetailImage: View {
    var item: Appetizer

    var body: some View {
        AsyncImage(url: URL(string: item.imageURL)) { image in
            image
                .resizable()
                .modifier(ImageModifier())

        } placeholder: {
            Image("food-placeholder")
                .resizable()
                .modifier(ImageModifier())
        }
    }

    struct ImageModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 225)
        }
    }
}

struct AppetizerListImage: View {
    var item: Appetizer

    var body: some View {
        AsyncImage(url: URL(string: item.imageURL)) { image in
            image
                .resizable()
                .modifier(ImageModifier())

        } placeholder: {
            Image("food-placeholder")
                .resizable()
                .modifier(ImageModifier())
        }
    }

    struct ImageModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(5)
        }
    }
}

#Preview {
    VStack {
        AppetizerListImage(item: MockData.orderItemOne)
        AppetizerDetailImage(item: MockData.orderItemOne)
    }
}
