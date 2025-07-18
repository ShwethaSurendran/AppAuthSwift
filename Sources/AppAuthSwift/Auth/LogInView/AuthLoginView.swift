//
//  AuthLoginView.swift
//  AppAuthDemo
//
//

import SwiftUI

struct AuthLoginView: View {
    let url: URL
    
    var body: some View {
        SafariWebView(url: url)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    AuthLoginView(url: URL(string: "http://www.google.com")!)
}
