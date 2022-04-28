//
//  UserImage.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 28.04.2022.
//

import SwiftUI

struct UserImage: View {
    var content: Image
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    var body: some View { content
        .resizable()
        .scaledToFit()
        .frame(height: 70)
        .modifier(CircleImage(shadowColor: .black,
                              shadowRadius: 3,
                              strokeColor: .blue,
                              strokeLineWidth: 2))
    }
}
