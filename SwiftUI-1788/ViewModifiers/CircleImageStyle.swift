//
//  CircleImage.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 27.04.2022.
//

import SwiftUI

struct CircleImageStyle: ViewModifier {
    
    let shadowColor: Color
    let shadowRadius: CGFloat
    let strokeColor: Color
    let strokeLineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
//            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(strokeColor, lineWidth: strokeLineWidth))
//            .scaledToFit()
            .padding()
            .shadow(color: shadowColor, radius: shadowRadius, x: 2, y: 2)
    }
}
