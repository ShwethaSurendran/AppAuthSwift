//
//  SimplyAuth.swift
//  AppAuthDemo
//
//

import Foundation

@available(iOS 15.0, *)
public actor SimplyAuth {
    public static var sharedInstance = SimplyAuth()
    private var tokenHandler:TokenHandler?

    // get access token from api
    public func getAuthToken(request:AuthRequest, token:Token? = nil) async throws -> Token? {
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
    public func getToken() async throws -> Token?  {
        return try await tokenHandler?.getToken()
    }
    
}

