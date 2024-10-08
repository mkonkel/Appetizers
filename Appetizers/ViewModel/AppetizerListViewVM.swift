//
//  AppetizerListViewVM.swift
//  Appetizers
//
//  Created by Michal Konkel on 08/10/2024.
//

import Foundation

final class AppetizerListViewVM : ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alert: AlertItem?
    @Published var isLoading = false
    
    func getAppetizers() {
        isLoading = true
        
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                
                switch result {
                case .success(let appetizers) :
                    self.appetizers = appetizers
                case .failure(let error) :
                    switch error {
                        case .invalidData: alert = AletrContext.invalidData
                        case .invalidUrl:  alert = AletrContext.invalidURL
                        case .invalidRepsonse:  alert = AletrContext.invalidResponse
                        case .unableToComplete: alert = AletrContext.unableToComplete
                    }
                }
            }
        }
    }
}
