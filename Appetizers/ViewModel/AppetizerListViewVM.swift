//
//  AppetizerListViewVM.swift
//  Appetizers
//
//  Created by Michal Konkel on 08/10/2024.
//

import Foundation

@MainActor final class AppetizerListViewVM: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alert: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var sellectedAppetizer: Appetizer?

    func getAppetizers() async {
        isLoading = true

        do {
            appetizers = try await NetworkManager.shared.getAppetizers()
            isLoading = false
        } catch {
            if let appError = error as? APError {
                switch appError {
                case .invalidUrl:
                    alert = AletrContext.invalidURL
                case .invalidRepsonse:
                    alert = AletrContext.invalidResponse
                case .invalidData:
                    alert = AletrContext.invalidData
                case .unableToComplete:
                    alert = AletrContext.unableToComplete
                }
            }
            alert = AletrContext.genericError
            isLoading = false
        }
    }
}
