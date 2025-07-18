//
//  TokenHandler.swift
//  AppAuthDemo
//
//

import Foundation

actor TokenHandler {
    
    // MARK: variables
    private var repo:TokenRequestRepoInterface
    private var token:Token?
    private var request: AuthRequest
    private var kTokenExpiryTimeOutLimit: Int = 60
    private var loginTask: Task<Token, Error>?
    private var tokenTask: Task<Token, Error>?
    
    // MARK:  when user login for the first time
    init(req: AuthRequest, 
         token: Token? = nil,
         repo: TokenRequestRepoInterface) {
        self.request = req
        self.token = token
        self.repo = repo
    }
    
    // MARK: update token incase logged in again
    func getToken(req:AuthRequest) async throws -> Token? {
        self.request = req
        return try await self.requestForToken()
    }
    
    // MARK: get token object, update if required
    func getToken() async throws -> Token? {
        //1. Check if already another task running, if yes-> all other thread must wait. no-> can go to next line
        //2.Check expiration time,
        //if yes-> If expiration time is less than one minute call refresh token.
        //no-> return token
        
        if let token {
            if let tokenTask {
                return try await tokenTask.value
            }
            
            return try await handleRequestIfRequired()
        }
        return try await requestForToken()
    }
    
    // MARK: get token for first login
    private func requestForToken() async throws -> Token? {
        self.token = try await login()
        return self.token
    }
    
    // MARK: call token request
    private func login() async throws -> Token? {
        if let loginTask {
            return try await loginTask.value
        }
        
        let task = Task {
            defer {
                loginTask = nil
            }
            return try await repo.getToken(request:request)
        }
        loginTask = task
        return try await task.value
    }
    
    // MARK: Handle Request if required
    func handleRequestIfRequired() async throws -> Token? {
        if checkIfTokenExpired() {
            //call refresh token
            self.token = try await self.refreshAccessToken()
            return self.token
        } else {
            return self.token
        }
    }
        
    // MARK: check if refresh token expired
    func checkIfTokenExpired() -> Bool {
        //No token object
        guard let accessToken = token else {
            return false
        }
        
        //If no expiry set, access token never expires
        guard let expiry = accessToken.expiresAt else {
            return true
        }
        
        return kTokenExpiryTimeOutLimit >= Int(expiry.timeIntervalSinceNow - Date().timeIntervalSinceNow)
    }
    
    // MARK: call refresh access token
    func refreshAccessToken() async throws -> Token? {
        self.request = AuthRequest(url: request.url,
                               grantType: request.grantType,
                               clientId: request.clientId,
                               refreshToken: request.refreshToken)
        let task = Task {
            defer {
                tokenTask = nil
            }
            return try await repo.getToken(request:request)
        }
        self.tokenTask = task
        return try await task.value
    }
}


