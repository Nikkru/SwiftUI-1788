//
//  UserCell.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 27.04.2022.
//

import SwiftUI

struct FriendsListView: View {
    
    var friends: [FriendModel] = FriendsList.friends.sorted(by: {$0.name < $1.name})
    var firstLetterNames: [Character] = FriendsList.friends.map { name in
        name.name[name.name.startIndex]
    }
    var titleSection: [Character] = []
    
    init() {
        let uniqTitleLettter = Array(Set(firstLetterNames))
        titleSection = uniqTitleLettter.sorted(by: <)
        for i in titleSection.indices {
            print("\(titleSection[i])", terminator: " ")
        }
    }
    
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
                }.listStyle(GroupedListStyle())
//        List {
//            ForEach(0..<titleSection.count) { index in
//                Section(header: Text(String(titleSection[index]))) {
//                    ForEach(friends, id: \.id) { item in
//                        NavigationLink(destination: FriendDetailView(friend: item)) {
//                            HStack() {
//                                UserImage {
//                                    Image(item.imageName)
//                                }
//                                SingleTitle {
//                                    Text(item.name)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
