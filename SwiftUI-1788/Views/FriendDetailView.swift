//
//  FriendDetailView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 30.04.2022.
//

import SwiftUI

struct FriendDetailView: View {
    
    var friend: FriendModel
    
    var body: some View {
        VStack {
            Image(friend.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .modifier(CornerRadiusWithShadow(
                    shadowColor: .black,
                    shadowRadius: 3,
                    cornerRadius: 12))
            
            Text(friend.name)
            Spacer()
            VStack {
                NavigationLink(destination: PicturesGalleryView()) {
                    VStack {
                        VStack {
                            Image(systemName: "camera.on.rectangle.fill")
                                .font(.system(size: 32))
                                .padding()
                                .foregroundColor(Color.blue)
                        }
                        .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                        Text("Images Gallery")
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: FriendsList.friends.first!)
    }
}
