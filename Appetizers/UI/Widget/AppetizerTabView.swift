//
//  ContentView.swift
//  Appetizers
//
//  Created by Michal Konkel on 01/10/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label(
                        title: { Text("Home")},
                        icon: { Image(systemName: "house") }
                    )
                }
            AccountView()
                .tabItem {
                    Label(
                        title: { Text("Account")},
                        icon: { Image(systemName: "person") }
                    )
                }
            OrderView()
                .tabItem {
                    Label(
                        title: { Text("Order")},
                        icon: { Image(systemName: "bag") }
                    )
                }
                .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}
