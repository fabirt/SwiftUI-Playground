//
//  RootView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct RootView: View {
    @State var showMenu = false
    @State var showWatchingContent = false
    @State var menuTranslation = CGSize.zero
    @State var showCourseDetail: AnyView?

    var body: some View {
        let springAnimation = Animation.spring(
            response: 0.5,
            dampingFraction: 0.6,
            blendDuration: 0)
        
        return ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).ignoresSafeArea()
            
            ZStack {
                Spacer()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color("background2"), Color.white]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .background(Color.white)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: showMenu ? 30.0 : 0, style: .continuous))
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0.0, y: 20.0)
                    .ignoresSafeArea()
                
                HomeView(
                    showMenu: $showMenu,
                    showWatchingContent: $showWatchingContent,
                    showCourseDetail: $showCourseDetail
                )
            }
            .scaleEffect(showMenu ? 0.9 : 1)
            .offset(y: showMenu ? -450 : 0)
            .offset(y: menuTranslation.height * 0.1)
            .rotation3DEffect(
                .degrees(showMenu ? Double(menuTranslation.height * 0.1) - 10.0 : 0),
                axis: (x: 10.0, y: 0.0, z: 0.0)
            )
            .animation(springAnimation)
            
            ProfileMenuView()
                .contentShape(Rectangle()) // Make it interactive
                .offset(y: showMenu ? 0 : screen.height)
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
            
            if showWatchingContent {
                Color.white.ignoresSafeArea()
                    .zIndex(2.0)

                CertificatesView()
                    .zIndex(3.0)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
                
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.showWatchingContent = false
                        }
                    }.padding(8)
                    Spacer()
                }
                .zIndex(4.0)
                .transition(AnyTransition.move(edge: .top))
                .animation(.spring())
            }
            
            if showCourseDetail != nil {
                showCourseDetail
                    .zIndex(5.0)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
