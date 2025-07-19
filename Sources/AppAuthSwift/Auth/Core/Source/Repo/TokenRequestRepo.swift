//
//  TokenRequestRepoInterface.swift
//  AppAuthDemo
//
//

import Foundation

@available(iOS 15.0, *)
struct TokenRequestRepo: TokenRequestRepoInterface, Sendable {
    
    private struct TokenReqParams:Encodable {
        let grant_type: String
        let code: String?
        let client_id: String
        let client_secret:String
        let redirect_uri:String?
        let refresh_token: String?
    }
    
    func getToken(request: AuthRequest) async throws -> Token {
        let params = TokenReqParams(grant_type: request.grantType.rawValue,
                                    code: request.code,
                                    client_id: request.clientId,
                                    client_secret: request.clientSecret,
                                    redirect_uri: request.redirectUri,
                                    refresh_token: request.refreshToken)

        var request = URLRequest(url: request.url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(params)
        let (data, response) = try await URLSession.shared.data(for: request)
        print(String(data: data, encoding: .utf8) ?? "No data", response)
        return try JSONDecoder().decode(Token.self, from: data)
    }
}
