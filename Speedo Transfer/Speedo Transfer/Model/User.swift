//
//  User.swift
//  Speedo Transfer
//
//  Created by Maria Ehab
//

import Foundation

// MARK: - User Model

struct User: Codable {
    var name: String
    var email: String
    var password: String
    var pass2: String
}

// MARK: - Login Response

struct LoginResponse: Codable {
    let token: String
    let tokenType: String
    let message: String
    let status: String
    let mainAccount: MainAccount
}

// MARK: - Main Account

struct MainAccount: Codable {
    let accountNumber: String
    let accountType: String
    let balance: Double
    let currency: String
    let accountName: String
    let accountDescription: String
    let active: Bool
    let createdAt: String
    let updatedAt: String
    let transactions: [Transaction]
}

// MARK: - Transaction

struct Transaction: Codable {
    let senderAccount: String
    let recipientAccount: String
    let senderName: String
    let recipientName: String
    let amount: Double
    let createdAt: String
    let success: Bool
    let currency: String
}
