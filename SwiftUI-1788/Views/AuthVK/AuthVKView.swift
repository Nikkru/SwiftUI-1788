//
//  AuthVKView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 23.05.2022.
//

import SwiftUI
import WebKit

struct AuthVKView: View {
    
    @ObservedObject var session = SessionVK.shared
    
    var body: some View {
        ZStack {
            VKLoginWebView()
        }
        .fullScreenCover(isPresented: $session.isAutorised) { TabBarView()
        }
    }
}

struct AuthVKView_Previews: PreviewProvider {
    static var previews: some View {
        AuthVKView()
    }
}
