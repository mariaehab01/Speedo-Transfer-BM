//
//  String+trimm.swift
//  Speedo Transfer
//
//  Created by Maria Ehab 
//

import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
