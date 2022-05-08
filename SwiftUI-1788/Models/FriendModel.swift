//
//  FriendModel.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 30.04.2022.
//

import Foundation

struct FriendModel: Identifiable  {
    var id = UUID()
    let name: String
    let imageName: String
}

struct FriendsList {
    static let friends = [
        FriendModel(name: "Homer Simpson", imageName: "homer-simpson"),
        FriendModel(name: "Бо", imageName: "Бо"),
        FriendModel(name: "Лапкин", imageName: "Лапкин"),
        FriendModel(name: "Выпендрежник", imageName: "Выпендрежник"),
        FriendModel(name: "Охламон", imageName: "Охламон"),
        FriendModel(name: "Чувырла", imageName: "Чувырла"),
        FriendModel(name: "Abe Simpson", imageName: "abe_simpson"),
        FriendModel(name: "Agnes Skinner", imageName: "agnes_skinner"),
        FriendModel(name: "Barney Gumble", imageName: "BarneyGumble"),
        FriendModel(name: "Bart Simpson", imageName: "BartSimpson"),
        FriendModel(name: "Book Guy", imageName: "Book Guy"),
        FriendModel(name: "Charles Montgomery Plantagenet Schicklgruber Burns",
               imageName: "CharlesMontgomeryPlantagenetSchicklgruberBurns"),
        FriendModel(name: "Lindsey Naegle", imageName: "lindsey_naegle"),
        FriendModel(name: "Otto Man", imageName: "OttoMan")
    ]
}
