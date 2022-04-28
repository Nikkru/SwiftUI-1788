//
//  UserCell.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 27.04.2022.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            
            UserImage {
                Image("homer-simpson")
            }
            
            SingleTitle {
                Text("Homer Simpson")
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
