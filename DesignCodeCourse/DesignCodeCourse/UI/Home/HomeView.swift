//
//  HomeView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct HomeView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
                AvatarMenuButton(showMenu: $showMenu)
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(0 ..< 5) { item in
                        SectionView()
                    }
                }
                .padding(.top, 8)
                .padding(.horizontal, 30)
                .padding(.bottom, 56)
            }
            
            Spacer()
        }
    }
}

fileprivate struct AvatarMenuButton: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            self.showMenu.toggle()
        }, label: {
            Image("Avatar")
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        })
    }
}

fileprivate struct SectionView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Prototype designs in SwiftUI")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 160, alignment: .leading)
                Spacer()
                Image("Logo1")
            }
            Text("18 Sections".uppercased())
                .font(.system(size: 15, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("Card2")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 260, height: 260)
        .padding(.horizontal)
        .padding(.top)
        .background(Color("card1"))
        .cornerRadius(30)
        .shadow(color: Color("card1").opacity(0.3), radius: 20, x: 0.0, y: 20.0)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showMenu: .constant(false))
    }
}
