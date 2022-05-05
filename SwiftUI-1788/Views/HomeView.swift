//
//  MainView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 28.04.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            
            Image(systemName: "house")
                .font(.system(size: 50))
                .foregroundColor(.blue)
                .navigationTitle("Home")
        }
        .navigationViewStyle(.stack)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
