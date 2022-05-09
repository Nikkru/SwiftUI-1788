//
//  ContainerView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 28.04.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedIn: $shouldShowMainView)
                
                //MARK: - NAVIGATION LINKS
                NavigationLink(destination: TabBarView(),
                               isActive: $shouldShowMainView) {
                    EmptyView()
                }
            }
        }
    }
    
    struct ContainerView_Previews: PreviewProvider {
        static var previews: some View {
            ContainerView()
        }
    }
}
