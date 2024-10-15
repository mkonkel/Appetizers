//
//  OrderView.swift
//  Appetizers
//
//  Created by Michal Konkel on 01/10/2024.
//

import SwiftUI

struct OrderView: View {
    @StateObject var viewModel = OrdersViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(viewModel.orders) { order in
                            AppetizerListItem(item: order)
                        }
                        .onDelete(perform: deleteItem)

                    }.listStyle(PlainListStyle())

                    Spacer()
                    button {
                        print("Clicked")
                    }
                }
                
                if(viewModel.orders.isEmpty) {
                    EmptyState(
                        imageName: "empty-order",
                        message: "You have no items in your order.\nPlease add an appetizer."
                    )
                }
            
            }
        }
        .navigationTitle("Order")
    }

    func deleteItem(at offsets: IndexSet) {
        viewModel.orders.remove(atOffsets: offsets)
    }
}

@ViewBuilder private func button(onClick: @escaping () -> Void) -> some View {
    Button {
        onClick()
    } label: {
        CustomButton(title: "$\(444, specifier: "%.2f") - Add To Order")
    }
    .padding(.bottom, 25)
}

#Preview {
    OrderView()
}
