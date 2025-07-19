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
    
    var loginURL: URL? {
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
