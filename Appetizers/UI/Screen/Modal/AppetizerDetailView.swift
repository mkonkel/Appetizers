//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Michal Konkel on 09/10/2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order: Order

    @Binding var isShowingDetail: Bool
    var appetizer: Appetizer!

    var body: some View {
        VStack {
            topImage(imageUrlString: appetizer.imageURL) {
                isShowingDetail = false
            }
            Spacer()
            title()
            Spacer()
            description()
            Spacer()
            nutritionDetails()
            Spacer()
            button {
                order.add(appetizer)
                isShowingDetail = false
            }
                
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
    }

    @ViewBuilder private func button(onClick: @escaping () -> Void) -> some View {
        Button {
            onClick()
        } label: {
            Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
        }
        .modifier(StandardButtonStyle())
        .padding(.bottom, 30)
    }

    @ViewBuilder private func title() -> some View {
        Text(appetizer.name)
            .font(.title2)
            .fontWeight(.semibold)
    }

    @ViewBuilder private func description() -> some View {
        Text(appetizer.description)
            .font(.body)
            .fontWeight(.regular)
            .multilineTextAlignment(.center)
            .padding()
    }

    @ViewBuilder private func nutritionDetails() -> some View {
        HStack(spacing: 40) {
            nutritionItem(name: "Calories", value: "\(appetizer.calories)")
            nutritionItem(name: "Carbs", value: "\(appetizer.carbs) g")
            nutritionItem(name: "Protein", value: "\(appetizer.protein) g")
        }.padding(.horizontal)
    }
}

@ViewBuilder private func topImage(
    imageUrlString: String,
    onClose: @escaping () -> Void
) -> some View {
    AppetizerRemoteImage(urlString: imageUrlString)
        .aspectRatio(contentMode: .fill)
        .frame(width: 320, height: 225)
        .overlay(alignment: .topTrailing) {
            DismissButton(onClick: onClose)
        }
}

@ViewBuilder private func nutritionItem(name: String, value: String) -> some View {
    HStack {
        VStack(spacing: 5) {
            Text(name)
                .font(.caption)
                .fontWeight(.bold)

            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailView(
        isShowingDetail: .constant(true),
        appetizer: MockData.sampleAppetizer
    )
}
