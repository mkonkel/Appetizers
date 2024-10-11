//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Michal Konkel on 09/10/2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    var appetizer: Appetizer!

    var body: some View {
        VStack {
            topImage(imageUrlString: appetizer.imageURL)
            Spacer()
            title()
            Spacer()
            description()
            Spacer()
            nutritionDetails()
            Spacer()
            button()
                .padding(.bottom, 30)
        }
        .padding(.horizontal)
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
    }

    @ViewBuilder private func button() -> some View {
        CustomButton(title: "$\(appetizer.price) - Add To Order")
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

@ViewBuilder private func topImage(imageUrlString: String) -> some View {
    AppetizerRemoteImage(urlString: imageUrlString)
        .aspectRatio(contentMode: .fit)
        .frame(width: 300, height: 225)
        .overlay(alignment: .topTrailing) {
            Button {
                print("dismiss")
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 30, height: 30)
                    .background(.white)
                    .clipShape(.circle)
                    .foregroundColor(.brandPrimary)
                    .opacity(0.6)
            }
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
        Spacer()
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}
