//
//  Order.swift
//  Appetizers
//
//  Created by Michal Konkel on 15/10/2024.
//

import Foundation
import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func remove(_ offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
