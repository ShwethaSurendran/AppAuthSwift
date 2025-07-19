//
//  AuthLoginView.swift
//  AppAuthDemo
//
//

import SwiftUI

@available(iOS 15.0, *)
public struct AuthLoginView: View {
    public let url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public var body: some View {
        SafariWebView(url: url)
            .edgesIgnoringSafeArea(.all)
    }
}

@available(iOS 15.0, *)
#Preview {
    AuthLoginView(url: URL(string: "http://www.google.com")!)
}
