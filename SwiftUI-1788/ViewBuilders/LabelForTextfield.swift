//
//  LabelForTextfield.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 09.05.2022.
//

import SwiftUI

struct LabelForTextfield: View {
    var content: Text
    init(@ViewBuilder content: () -> Text) {
        self.content = content()
    }
    var body: some View { content
        .modifier(LabelForTextFieldStyle(
            frameMaxWidth: 150,
            conerRadius: 8,
            foregroundColor: .white,
            shadowRadius: 5)
        )
        .font(.title)
    }
}

//struct LabelForTextfield_Previews: PreviewProvider {
//    static var previews: some View {
//        LabelForTextfield()
//    }
//}
