//
//  WeatherImage.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 26.04.2022.
//

import SwiftUI

struct WeatherImage: View {
    var content: Image
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View { content
        .resizable()
        .frame(width: 100, height: 100)
        .modifier(CircleShadow(shadowColor: .blue, shadowRadius: 5))
    }
}
