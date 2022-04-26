//
//  CircleShadow.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 26.04.2022.
//

import SwiftUI

struct CircelShadow: ViewModifier {
    
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
            .fill(Color.white)
            .shadow(color: shadowColor, radius: shadowRadius))
    }
}
