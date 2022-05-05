//
//  TitelText.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 28.04.2022.
//

import SwiftUI

struct TitleText: View {
    var content: Text
    init(@ViewBuilder content: () -> Text) {
        self.content = content()
    }
    
    var body: some View { content
        .fontWeight(.semibold)
        .font(.headline)
        .minimumScaleFactor(0.5)
    }
}
