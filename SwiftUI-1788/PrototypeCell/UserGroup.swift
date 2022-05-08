//
//  UserGroup.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 28.04.2022.
//

import SwiftUI

struct UserGroup: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            
            UserImage {
                Image("beer-club-simpson")
            }
            
            VStack(alignment: .leading, spacing: 5) {
                TitleText {
                    Text("Beer Club of Homer Simpson")
                }
                FootnoteText {
            Text("The Cause of - And Solution to - All of life's Problems")
                }
            }
            Spacer()
        }
    }

}

struct UserGroup_Previews: PreviewProvider {
    static var previews: some View {
        UserGroup()
    }
}
