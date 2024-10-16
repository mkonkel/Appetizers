//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Michal Konkel on 01/10/2024.
//

import SwiftUI

@main
struct AppetizersApp: App {
    let order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
