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
            Image("homer-simpson")
                .resizable()
                            .scaledToFit()
                .frame(height: 70,
                       alignment: .leading)
                .modifier(CircleImage(shadowColor: .black,
                                      shadowRadius: 4,
                                      strokeColor: .blue,
                                      strokeLineWidth: 2))
            
            
            Text("Homer Simpson")
                .fontWeight(.light)
                .font(.title)
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
