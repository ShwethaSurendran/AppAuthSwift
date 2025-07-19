//
//  AuthRequest.swift
//  AppAuthDemo
//
//

import Foundation

public struct AuthRequest: Sendable {
    let url: URL
    var grantType: GrantType = .authorization
    var code: String = ""
    let clientId: String
    var clientSecret: String = ""
    var redirectUri: String = ""
    var refreshToken: String = ""
    
    public init(url: URL, grantType: GrantType, code: String = "", clientId: String, clientSecret: String = "", redirectUri: String = "", refreshToken: String) {
        self.url = url
        self.grantType = grantType
        self.code = code
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectUri = redirectUri
        self.refreshToken = refreshToken
    }
    
}

public enum GrantType: String, Sendable  {
    case authorization = "authorization_code"
    case refreshToken = "refresh_token"
}
