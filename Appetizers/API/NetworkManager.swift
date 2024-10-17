//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Michal Konkel on 07/10/2024.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    private let appetizersURL = "\(baseURL)/appetizers"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizersURL) else {
            throw APError.invalidUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APError.invalidRepsonse
        }
    }
}
