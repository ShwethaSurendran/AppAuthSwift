//
//  SimplyAuth.swift
//  AppAuthDemo
//
//

import Foundation

final class AppAuthSwift {
    static var sharedInstance = AppAuthSwift()
    private var tokenHandler:TokenHandler?

    // get access token from api
    func getAuthToken(request:AuthRequest, token:Token? = nil) async throws -> Token? {
        if tokenHandler == nil {
            tokenHandler = TokenHandler(req: request,
                                        token: token,
                                        repo: TokenRequestRepo())
            return try await tokenHandler?.getToken()
        } else {
            return try await tokenHandler?.getToken(req: request)
        }
    }
    
    // Return token data
    func getToken() async throws -> Token?  {
        return try await tokenHandler?.getToken()
    }
    
}

