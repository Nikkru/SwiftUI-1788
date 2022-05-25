//
//  VKLoginWebView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 23.05.2022.
//

import SwiftUI
import WebKit

struct VKLoginWebView: UIViewRepresentable {
    
    private let appId = "8167441"
    
    fileprivate let navigationDelegate = WebViewNavigationDelegate()
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: appId),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "scope", value: "401502"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "state", value: "1234567"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        return urlComponents.url.map { URLRequest(url: $0) }
    }
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment
        else {
            decisionHandler(.allow)
            
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                
                return dict
            }
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString)
        else {
            decisionHandler(.allow)
            return
        }
        
//        UserDefaults.standard.set(token, forKey: "vkToken")
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "vkTokenSaved"), object: self)
        
        print("token = \(token)")
        print("user Id = \(userIdString)")
        
        SessionVK.shared.token = token
        SessionVK.shared.userId = userIdString
        
        SessionVK.shared.isAutorised = true
        
        decisionHandler(.cancel)
    }
}
