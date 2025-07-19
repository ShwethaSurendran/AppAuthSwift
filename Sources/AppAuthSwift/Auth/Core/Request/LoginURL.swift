//
//  LoginURL.swift
//  AppAuthDemo
//
//

import Foundation

public struct LoginURL {
    
    let baseURL:String
    let scope:[String]
    let responseType:String
    let redirectURI:String
    let clientId:String
    
    public init(baseURL: String, scope: [String], responseType: String, redirectURI: String, clientId: String) {
        self.baseURL = baseURL
        self.scope = scope
        self.responseType = responseType
        self.redirectURI = redirectURI
        self.clientId = clientId
    }
    
    public var loginURL: URL? {
        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            URLQueryItem(name: "scope", value: scope.joined(separator: "+")),
            URLQueryItem(name: "response_type", value: responseType),
            URLQueryItem(name: "redirect_uri", value: redirectURI),
            URLQueryItem(name: "client_id", value: clientId)
        ]
        return components?.url
    }
    
}
