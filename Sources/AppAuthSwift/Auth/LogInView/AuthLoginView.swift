//
//  AuthLoginView.swift
//  AppAuthDemo
//
//

import SwiftUI

@available(iOS 15.0, *)
struct AuthLoginView: View {
    let url: URL
    
    var body: some View {
        SafariWebView(url: url)
            .edgesIgnoringSafeArea(.all)
    }
}

@available(iOS 15.0, *)
#Preview {
    AuthLoginView(url: URL(string: "http://www.google.com")!)
}
