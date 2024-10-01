//
//  ContentView.swift
//  Appetizers
//
//  Created by Michal Konkel on 01/10/2024.
//

import SwiftUI

struct AppetizerTabView: View {
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
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
}
