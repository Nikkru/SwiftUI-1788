//
//  CornerRadius.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 27.04.2022.
//

import SwiftUI

struct CornerRadiusWithShadow: ViewModifier {
    
    let shadowColor: Color
    let shadowRadius: CGFloat
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius)
//            .background(Color.clear)
                .shadow(color: shadowColor, radius: shadowRadius)
    }
}

