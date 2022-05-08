//
//  AlertController.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 27.04.2022.
//

import SwiftUI

struct AlertView<Content: View>: View {
   
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
                .padding()
            Divider()
            HStack {
                Button(action: {}, label: {
                    Text("Cancel")
                        .bold()
                        .foregroundColor(.orange)
                })
            }
        }
        .frame(width: UIScreen.main.bounds.size.width/2)
        .background(Color.blue)
        .cornerRadius(7)
        .padding()
    }
}

