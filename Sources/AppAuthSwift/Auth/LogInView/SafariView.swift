//
//  SafariView.swift
//  AppAuthDemo
//
//

import SwiftUI
import SafariServices

@available(iOS 15.0, *)
struct SafariWebView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
    
}
