//
//  User.swift
//  Appetizers
//
//  Created by Michal Konkel on 14/10/2024.
//

import Foundation

struct User : Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthDate: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefils: Bool = false
}
