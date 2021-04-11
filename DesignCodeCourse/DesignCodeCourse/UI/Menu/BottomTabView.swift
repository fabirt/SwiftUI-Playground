//
//  BottomTabView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 9/04/21.
//

import SwiftUI

struct BottomTabView: View {
    var body: some View {
        TabView {
            RootView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            CertificatesView()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Certificates")
                }
        }
        .accentColor(Color("card3"))
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
