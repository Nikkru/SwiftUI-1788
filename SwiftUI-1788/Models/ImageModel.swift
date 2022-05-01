//
//  ImageModel.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 01.05.2022.
//

import Foundation


struct ImageModel: Identifiable  {
    var id = UUID()
    let name: String
    let imageName: String
}

struct ImagesList {
    static let images = [
        ImageModel(name: "Homer Simpson", imageName: "homer-simpson"),
        ImageModel(name: "Бо", imageName: "Бо"),
        ImageModel(name: "Лапкин", imageName: "Лапкин"),
        ImageModel(name: "Выпендрежник", imageName: "Выпендрежник"),
        ImageModel(name: "Охламон", imageName: "Охламон"),
        ImageModel(name: "Чувырла", imageName: "Чувырла"),
        ImageModel(name: "Abe Simpson", imageName: "abe_simpson"),
        ImageModel(name: "Agnes Skinner", imageName: "agnes_skinner"),
        ImageModel(name: "Barney Gumble", imageName: "BarneyGumble"),
        ImageModel(name: "Bart Simpson", imageName: "BartSimpson"),
        ImageModel(name: "Book Guy", imageName: "Book Guy"),
        ImageModel(name: "Charles Montgomery Plantagenet Schicklgruber Burns",
               imageName: "CharlesMontgomeryPlantagenetSchicklgruberBurns"),
        ImageModel(name: "Lindsey Naegle", imageName: "lindsey_naegle"),
        ImageModel(name: "Otto Man", imageName: "OttoMan")
    ]
}
