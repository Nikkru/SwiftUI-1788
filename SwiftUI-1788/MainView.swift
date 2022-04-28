//
//  MainView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 28.04.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
                Text("Wellcome, User!")
                .font(.title)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
            }
                Text("Friends")
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
