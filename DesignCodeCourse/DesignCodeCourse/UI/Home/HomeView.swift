//
//  HomeView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct HomeView: View {
    @Binding var showMenu: Bool
    @State private var showUpdates = false
    
    var body: some View {
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
                HStack(spacing: 30) {
                    HStack(spacing: 16) {
                        RingView(progress: 0.68, size: 44.0, show: .constant(true))
                        VStack(alignment: .leading) {
                            Text("6 minutes left")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Watched 10 mins today")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .proShadow()
                    
                    RingView(progress: 0.92, size: 44.0, startColor: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), show: .constant(true))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .proShadow()
                    
                    RingView(progress: 0.24, size: 44.0, startColor: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), endColor: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), show: .constant(true))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .proShadow()
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)
                .padding(.bottom, 42)
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
    let item: SectionItem
    
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
        .frame(width: 260, height: 260)
        .padding(.horizontal)
        .padding(.top)
        .background(item.backgroundColor)
        .cornerRadius(30)
        .shadow(color: item.backgroundColor.opacity(0.3), radius: 20, x: 0.0, y: 20.0)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showMenu: .constant(false))
    }
}
