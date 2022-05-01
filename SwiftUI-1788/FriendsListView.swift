//
//  UserCell.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 27.04.2022.
//

import SwiftUI

struct FriendsListView: View {
    
    var friends: [FriendModel] = FriendsList.friends
    var body: some View {
        List(friends, id: \.id) { friend in
            NavigationLink(destination: FriendDetailView(friend: friend)) {
                HStack() {
                    UserImage {
                        Image(friend.imageName)
                    }
                    
                    SingleTitle {
                        Text(friend.name)
                    }
                    Spacer()
                }
            }
        }
    }
}


struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
