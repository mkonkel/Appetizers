//
//  AccountViewViewModel.swift
//  Appetizers
//
//  Created by Michal Konkel on 14/10/2024.
//

import Foundation
import SwiftUI

final class AccountViewViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alert: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alert = AletrContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alert = AletrContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        saveUser()
    }
    
    func retrieveUser() {
        guard let userData else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alert = AletrContext.userSaveError
        }
    }
    
    private func saveUser() {
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alert = AletrContext.userSaveSuccess
        } catch {
            alert = AletrContext.userSaveError
        }
    }
}
