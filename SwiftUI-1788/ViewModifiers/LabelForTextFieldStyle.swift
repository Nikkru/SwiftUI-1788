//
//  LabelForTextField.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 09.05.2022.
//

import SwiftUI

struct LabelForTextFieldStyle: ViewModifier {
    
    let frameMaxWidth: CGFloat
    let conerRadius: CGFloat
    let foregroundColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: frameMaxWidth)
            .background(RoundedRectangle(cornerRadius: conerRadius)
                .fill(.tertiary)
                .shadow(radius: shadowRadius))
            .foregroundColor(foregroundColor)
    }
}
//
//struct LabelForTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        LabelForTextField()
//    }
//}
