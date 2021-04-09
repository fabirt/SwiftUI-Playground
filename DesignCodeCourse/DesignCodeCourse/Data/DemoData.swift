//
//  DemoData.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 8/04/21.
//
import SwiftUI

var homeSections = [
    SectionItem(
        title: "Prototype designs in SwiftUI",
        subtitle: "18 Sections",
        logoName: "Logo1",
        image: Image(uiImage: UIImage(#imageLiteral(resourceName: "Card4"))),
        backgroundColor: Color("card1")),
    SectionItem(
        title: "Build a SwiftUI app",
        subtitle: "20 Sections",
        logoName: "Logo1",
        image: Image(uiImage: UIImage(#imageLiteral(resourceName: "Background1"))),
        backgroundColor: Color("card2")),
    SectionItem(
        title: "SwiftUI Advanced",
        subtitle: "20 Sections",
        logoName: "Logo1",
        image: Image(uiImage: UIImage(#imageLiteral(resourceName: "Card2"))),
        backgroundColor: Color("card3"))
]

let updatesData = [
    UpdateItem(title: "SwiftUI Advanced", imageName: "Card1", body: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: Date()),
    UpdateItem(title: "Webflow", imageName: "Card2", body: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: Date()),
    UpdateItem(title: "ProtoPie", imageName: "Card3", body: "Quickly prototype advanced animations and interactions for mobile and Web.", date: Date()),
    UpdateItem(title: "SwiftUI", imageName: "Card4", body: "Learn how to code custom UIs, animations, gestures and components in Xcode 11", date: Date()),
    UpdateItem(title: "Framer Playground", imageName: "Card5", body: "Create powerful animations and interactions with the Framer X code editor", date: Date())
]


