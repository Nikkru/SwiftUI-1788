//
//  SingleTitle.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 28.04.2022.
//

import SwiftUI

struct SingleTitle: View {
    var content: Text
    init(@ViewBuilder content: () -> Text) {
        self.content = content()
    }
    
    var body: some View { content
        .fontWeight(.light)
        .font(.title2)
        .minimumScaleFactor(0.5)
    }
}
