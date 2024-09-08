//
//  String+trimm.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 07/09/2024.
//

import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
