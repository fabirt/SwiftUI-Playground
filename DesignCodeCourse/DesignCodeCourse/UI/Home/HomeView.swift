//
//  HomeView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct HomeView: View {
    @Binding var showMenu: Bool
    @Binding var showWatchingContent: Bool
    @State private var showUpdates = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    AvatarMenuButton(showMenu: $showMenu)
                    
                    Button(action: { self.showUpdates.toggle() }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $showUpdates, content: {
                        UpdatesView()
                    })
                }
                .padding(.leading, 30)
                .padding(.trailing, 16)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchingsView()
                        .onTapGesture {
                            self.showWatchingContent = true
                        }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(homeSections) { item in
                            GeometryReader { (geometry: GeometryProxy) in
                                let degrees = Double(geometry.frame(in: .global).minX - 30) / -20
                                
                                SectionView(item: item)
                                    .rotation3DEffect(
                                        .degrees(degrees),
                                        axis: (x: 0.0, y: 1.0, z: 0.0)
                                    )
                            }.frame(width: 292, height: 276)
                        }
                    }
                    .padding(.top, 8)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 56)
                }
                
                HStack {
                    Text("Courses")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.bottom)
                
                SectionView(item: homeSections[2], size: screen.width - 92)
                    .padding(.bottom)
                
                SectionView(item: homeSections[1], size: screen.width - 92)
                    .padding(.bottom)
                
                Spacer()
            }
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
    let item: SectionItem
    var size: CGFloat = 260
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(item.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 160, alignment: .leading)
                Spacer()
                Image(item.logoName)
            }
            Text(item.subtitle.uppercased())
                .font(.system(size: 15, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            item.image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: size, height: size)
        .padding(.horizontal)
        .padding(.top)
        .background(item.backgroundColor)
        .cornerRadius(30)
        .shadow(color: item.backgroundColor.opacity(0.3), radius: 20, x: 0.0, y: 20.0)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showMenu: .constant(false), showWatchingContent: .constant(false))
    }
}
