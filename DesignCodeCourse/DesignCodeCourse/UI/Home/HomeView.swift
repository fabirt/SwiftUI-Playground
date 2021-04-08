//
//  HomeView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct HomeView: View {
    @State var showMenu = false
    @State var menuTranslation = CGSize.zero
    
    var body: some View {
        let springAnimation = Animation.spring(
            response: 0.5,
            dampingFraction: 0.6,
            blendDuration: 0)
        
        return ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        self.showMenu.toggle()
                    }, label: {
                        Image("Avatar")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    })
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
                Spacer()
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: showMenu ? 30.0 : 0, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0.0, y: 20.0)
            .scaleEffect(showMenu ? 0.9 : 1)
            .offset(y: showMenu ? -450 : 0)
            .offset(y: menuTranslation.height * 0.1)
            .rotation3DEffect(
                .degrees(showMenu ? Double(menuTranslation.height * 0.1) - 10.0 : 0),
                axis: (x: 10.0, y: 0.0, z: 0.0)
            )
            .animation(springAnimation)
            
            MenuView()
                .contentShape(Rectangle())
                .offset(y: showMenu ? 0 : 600)
                .offset(y: menuTranslation.height)
                .animation(springAnimation)
                .onTapGesture {
                    self.showMenu.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.menuTranslation = value.translation
                        }
                        .onEnded { value in
                            if value.translation.height > 50 {
                                self.showMenu = false
                            }
                            self.menuTranslation = .zero
                        }
                )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
