//
//  String+Ext.swift
//  Appetizers
//
//  Created by Michal Konkel on 14/10/2024.
//

import Foundation
import RegexBuilder

extension String {
    var isValidEmail: Bool {
        let emailRegEx = Regex {
            /^/
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("0"..."9"),
                    ("a"..."z")
                )
            }
            "@"
            OneOrMore {
                CharacterClass(
                    .anyOf(".-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            "."
            Repeat(2...64) {
                CharacterClass(
                    ("A"..."Z"),
                    ("a"..."z")
                )
            }
            /$/
        }
        
        return self.wholeMatch(of: emailRegEx) != nil
    }
}
