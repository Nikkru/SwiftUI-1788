//
//  TabBarView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 01.05.2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
            PicturesGalleryView()
                .tabItem {
                    Image(systemName: "camera.on.rectangle.fill")
                    Text("Pictures gallery")
                }
            FriendsListView()
                .tabItem {
                    Image(systemName: "person.2.circle.fill")
                    Text("Friends")
                }
            Text("Groups")
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Groups")
                }
            Text("News")
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
