//
//  Alert.swift
//  Appetizers
//
//  Created by Michal Konkel on 08/10/2024.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AletrContext {
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("There was an issuse connecting with the server."),
        dismissButton: .default(Text("OK"))
    )
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from the server."),
        dismissButton: .default(Text("OK"))
    )
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("The data recieved from the server was invalid."),
        dismissButton: .default(Text("OK"))
    )
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to completed your request at this time."),
        dismissButton: .default(Text("OK"))
    )
}


