//
//  OrdersViewModel.swift
//  Appetizers
//
//  Created by Michal Konkel on 15/10/2024.
//

import Foundation

final class OrdersViewModel : ObservableObject {
    @Published var orders: [Appetizer] = MockData.orderItems
//    @Published var totalPrice = orders.map({$0.price}).reduce(0, +)
}
