//
//  ContentView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 20.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var login = ""
    
    var body: some View {
    VStack {
        Text("Hello, World!")
            .padding(.top, 32)
            .font(.largeTitle)
        
        HStack {
            Text("Login:")
        TextField("", text: $login)
                .frame(maxWidth: 150)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        
        Spacer()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
