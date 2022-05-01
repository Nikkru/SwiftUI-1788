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
//        TabView {
//            Text("Wellcome, User!")
//                .font(.title)
//                .tabItem {
//                    Image(systemName: "house")
//                    Text("Home")
//            }
//            Text("Gallery")
//                .tabItem {
//                    Image(systemName: "camera.on.rectangle.fill")
//                    Text("Pictures gallery")
//                }
//            FriendsListView()
//                .tabItem {
//                    Image(systemName: "person.2.circle.fill")
//                    Text("Friends")
//                }
//            Text("Groups")
//                .tabItem {
//                    Image(systemName: "person.3.fill")
//                    Text("Groups")
//                }
//            Text("News")
//                .tabItem {
//                    Image(systemName: "newspaper.fill")
//                    Text("News")
//                }
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
