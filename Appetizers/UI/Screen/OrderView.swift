//
//  OrderView.swift
//  Appetizers
//
//  Created by Michal Konkel on 01/10/2024.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { order in
                            AppetizerListItem(item: order)
                        }
                        .onDelete(perform: order.remove)

                    }.listStyle(PlainListStyle())

                    Spacer()
                    button(totalPrice: order.totalPrice) {
                        print("Clicked")
                    }
                }

                if order.items.isEmpty {
                    EmptyState(
                        imageName: "empty-order",
                        message: "You have no items in your order.\nPlease add an appetizer."
                    )
                }
            }
        }
        .navigationTitle("Order")
    }
}

@ViewBuilder private func button(totalPrice: Double, onClick: @escaping () -> Void) -> some View {
    Button {
        onClick()
    } label: {
        Text("$\(totalPrice, specifier: "%.2f") - Add To Order")
    }
    .modifier(StandardButtonStyle())
    .padding(.bottom, 25)
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
