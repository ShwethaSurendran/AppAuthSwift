//
//  Token.swift
//  AppAuthDemo
//
//

import Foundation

struct Token: Decodable {
    let accessToken: String
    let idToken: String
    let scope: String
    let refreshToken: String
    let tokenType: String
    
    private let expiresIn: Int
    var expiresAt: Date? {
        Date().addingTimeInterval(TimeInterval(expiresIn))
    }
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case idToken = "id_token"
        case scope
        case refreshToken = "refresh_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }
}
