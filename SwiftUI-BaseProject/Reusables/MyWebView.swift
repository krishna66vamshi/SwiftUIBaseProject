//
//  MyWebView.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 14/07/22.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
 
     var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
