//
//  AuthVKView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 12.05.2022.
//

import SwiftUI
import WebKit

struct AuthVKView_F: View {
    
    private let appId = "8167441"
    
    var body: some View {
        NavigationView {
            VStack {
                WebView(request: configAuthVKRequest())
            }.navigationTitle(Text("VK"))
        }
    }
    
    func configAuthVKRequest() -> URLRequest {
        
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
        
        let request = URLRequest(url: urlComponents.url!)
        
        return request
        //        webview.load(request)
    }
}


struct WebView: UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.navigationDelegate = context.coordinator
        uiView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        let parent: WebView
        init(_ parent: WebView) {
            self.parent = parent
        }
        
//        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//            <#code#>
//        }
        /*
        func webView(
            _ webView: WKWebView,
            decidePolicyFor navigationResponse: WKNavigationResponse,
            decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
                guard let url = navigationResponse.response.url,
                      url.path == "/blank.html",
                      let fragment = url.fragment  else {
                    decisionHandler(.allow)
                    return
                }
                
                //  разбиваем строку ответа на массив строк
                let params = fragment
                    .components(separatedBy: "&")
                    .map { $0.components(separatedBy: "=") }
                    .reduce([String: String]()) { result, param in // собираем из массива словарь
                        var dict = result // буфер
                        let key = param[0]
                        let value = param[1]
                        dict[key] = value
                        return dict
                    }
                guard let token = params["access_token"],
                let userId = params["user_id"] else { return }
                
                print("token = \(token)")
                print("user Id = \(userId)")
                
                SessionVK.shared.token = token
                SessionVK.shared.userId = userId
                
                NavigationView {
                    TabBarView()
                }
            }
        */
    }
}

struct AuthVKView_F_Previews: PreviewProvider {
    static var previews: some View {
        AuthVKView()
    }
}
/*
 extension AuthVKView: WKNavigationDelegate {
 
 func webView(_ webView: WKWebView,
 decidePolicyFor navigationResponse: WKNavigationResponse,
 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
 
 guard let url = navigationResponse.response.url,
 url.path == "/blank.html",
 let fragment = url.fragment  else {
 decisionHandler(.allow)
 return
 }
 
 //  разбиваем строку ответа на массив строк
 let params = fragment
 .components(separatedBy: "&")
 .map { $0.components(separatedBy: "=") }
 .reduce([String: String]()) { result, param in // собираем из массива словарь
 var dict = result // буфер
 let key = param[0]
 let value = param[1]
 dict[key] = value
 return dict
 }
 
 guard let token = params["access_token"],
 let userId = params["user_id"] else { return }
 
 print("token = \(token)")
 print("user Id = \(userId)")
 
 Session.shared.token = token
 Session.shared.userId = userId
 
 //добавляем пользователя в Firebase
 let userFB = UserFB(id: Int(userId) ?? -1, addedGroups: [])
 let usersContainerRef = ref.child(userId)
 usersContainerRef.setValue(userFB.toAnyObject())
 
 performSegue(withIdentifier: "ShowTabBarSegue", sender: nil)
 
 decisionHandler(.cancel)
 }
 }
 */
