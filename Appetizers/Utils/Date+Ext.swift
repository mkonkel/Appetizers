//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Michal Konkel on 17/10/2024.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundretTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
